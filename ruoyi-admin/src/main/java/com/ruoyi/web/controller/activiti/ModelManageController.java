package com.ruoyi.web.controller.activiti;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.Leaveapply;
import com.ruoyi.system.domain.ModelParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.ActivitiIllegalArgumentException;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.query.QueryProperty;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.activiti.engine.repository.ModelQuery;
import org.apache.poi.util.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Api(value = "模型管理接口")
@Controller
@RequestMapping("/model/manage")
public class ModelManageController extends BaseController {

    @Resource
    RepositoryService repositoryService;

    @Resource
    private ObjectMapper objectMapper;

    private String prefix = "activiti/manage";


    @GetMapping("")
    public String modelList() {
        return prefix + "/modelList";
    }

    @ApiOperation("查询所有模型")
    @RequestMapping(value = "/modelLists", method = RequestMethod.POST)
    @ResponseBody
    public TableDataInfo modelLists(@RequestParam(required = false) String key, @RequestParam(required = false) String name,
                                    Integer pageSize, Integer pageNum) {
        ModelQuery query = repositoryService.createModelQuery();
        if (StringUtils.isNotEmpty(key)) {
            query.modelKey(key);
        }
        if (StringUtils.isNotEmpty(name)) {
            query.modelName(name);
        }
        int start = (pageNum - 1) * pageSize;
        List<Model> page = query.orderByCreateTime().desc().listPage(start, pageSize);
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(page);
        rspData.setTotal(query.list().size());
        return rspData;
    }

    /**
     * 新增模型页面
     * @return
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增模型
     */
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ModelParam modelRequest) throws JsonProcessingException {
        Model model = repositoryService.newModel();
        model.setCategory(modelRequest.getCategory());
        model.setKey(modelRequest.getKey());
        ObjectNode modelNode = objectMapper.createObjectNode();
        modelNode.put(ModelDataJsonConstants.MODEL_NAME, modelRequest.getName());
        modelNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, modelRequest.getDescription());
        modelNode.put(ModelDataJsonConstants.MODEL_REVISION, modelRequest.getVersion());
        model.setMetaInfo(modelNode.toString());
        model.setName(modelRequest.getName());
        model.setVersion(modelRequest.getVersion());
        ModelQuery modelQuery = repositoryService.createModelQuery();
        List<Model> list = modelQuery.modelKey(modelRequest.getKey()).list();
        if (list.size() > 0) {
            return AjaxResult.error("模型标识不能重复");
        } else {
            // 保存模型到act_re_model表
            repositoryService.saveModel(model);
            HashMap<String, Object> content = new HashMap();
            content.put("resourceId", model.getId());
            HashMap<String, String> properties = new HashMap();
            properties.put("process_id", modelRequest.getKey());
            properties.put("name", modelRequest.getName());
            properties.put("category", modelRequest.getCategory());
            content.put("properties", properties);
            HashMap<String, String> stencilset = new HashMap();
            stencilset.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
            content.put("stencilset", stencilset);
            // 保存模型文件到act_ge_bytearray表
            repositoryService.addModelEditorSource(model.getId(), objectMapper.writeValueAsBytes(content));
            return AjaxResult.success(model);
        }
    }

    @RequestMapping("/deploy/{modelId}")
    @ResponseBody
    public AjaxResult modelDeployment(@PathVariable String modelId) {
        try {
            Model model = repositoryService.getModel(modelId);
            byte[] modelData = repositoryService.getModelEditorSource(modelId);
            JsonNode jsonNode = objectMapper.readTree(modelData);
            BpmnModel bpmnModel = (new BpmnJsonConverter()).convertToBpmnModel(jsonNode);
            Deployment deploy = repositoryService.createDeployment().category(model.getCategory())
                    .name(model.getName()).key(model.getKey())
                    .addBpmnModel(model.getKey() + ".bpmn20.xml", bpmnModel)
                    .deploy();
            model.setDeploymentId(deploy.getId());
            repositoryService.saveModel(model);
            return AjaxResult.success();
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("流程图不合规范，请重新设计");
        }
    }

    @PostMapping("/remove/{modelId}")
    @ResponseBody
    public AjaxResult removeModel(@PathVariable String modelId) {
        repositoryService.deleteModel(modelId);
        return AjaxResult.success("删除成功");
    }

    @GetMapping("/export/{modelId}")
    public void modelExport(@PathVariable String modelId, HttpServletResponse response) throws IOException {
        byte[] modelData = repositoryService.getModelEditorSource(modelId);
        JsonNode jsonNode = objectMapper.readTree(modelData);
        BpmnModel bpmnModel = (new BpmnJsonConverter()).convertToBpmnModel(jsonNode);
        byte[] xmlBytes = (new BpmnXMLConverter()).convertToXML(bpmnModel, "UTF-8");
        ByteArrayInputStream in = new ByteArrayInputStream(xmlBytes);
        IOUtils.copy(in, response.getOutputStream());
        String filename = bpmnModel.getMainProcess().getId() + ".bpmn20.xml";
        response.setHeader("Content-Disposition","attachment;filename=" + filename);
        response.setHeader("content-Type", "application/xml");
        response.flushBuffer();
    }


}
