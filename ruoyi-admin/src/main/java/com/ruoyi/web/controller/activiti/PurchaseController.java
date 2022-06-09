package com.ruoyi.web.controller.activiti;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.Leaveapply;
import com.ruoyi.system.service.ISysUserService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Purchase;
import com.ruoyi.system.service.IPurchaseService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.annotation.Resource;

/**
 * 采购Controller
 * 
 * @author shenzhanwang
 * @date 2022-05-28
 */
@Controller
@RequestMapping("/purchase")
public class PurchaseController extends BaseController
{
    private String prefix = "activiti/purchase";

    @Autowired
    private IPurchaseService purchaseService;

    @Autowired
    private ISysUserService userService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;

    @GetMapping()
    public String purchase()
    {
        return prefix + "/purchase";
    }

    /**
     * 查询采购列表
     */
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Purchase purchase)
    {
        startPage();
        List<Purchase> list = purchaseService.selectPurchaseList(purchase);
        return getDataTable(list);
    }

    /**
     * 导出采购列表
     */
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Purchase purchase)
    {
        List<Purchase> list = purchaseService.selectPurchaseList(purchase);
        ExcelUtil<Purchase> util = new ExcelUtil<Purchase>(Purchase.class);
        return util.exportExcel(list, "采购数据");
    }

    /**
     * 新增采购
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        SysUser user = getSysUser();
        mmap.put("user", user);
        mmap.put("userlist", userService.selectUserList(new SysUser()));
        return prefix + "/add";
    }

    /**
     * 新增保存采购
     */
    @Log(title = "采购", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Purchase purchase)
    {
        purchase.setApplytime(new Date());
        return toAjax(purchaseService.insertPurchase(purchase));
    }

    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult edit(Purchase purchase)
    {
        return toAjax(purchaseService.updatePurchase(purchase));
    }

    /**
     * 删除采购
     */
    @Log(title = "采购", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(purchaseService.deletePurchaseByIds(ids));
    }

    /**
     * 采购经理审批
     */
    @GetMapping("/purchasemanager")
    public String purchasemanager(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("applyTime", sdf.format(apply.getApplytime()));
            mmap.put("apply", apply);
            mmap.put("taskid", taskid);
        }
        return prefix + "/purchasemanager";
    }

    /**
     * 财务审批
     */
    @GetMapping("/finance")
    public String finance(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("applyTime", sdf.format(apply.getApplytime()));
            mmap.put("apply", apply);
            mmap.put("taskid", taskid);
        }
        return prefix + "/finance";
    }

    /**
     * 总经理审批
     */
    @GetMapping("/manager")
    public String manager(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("applyTime", sdf.format(apply.getApplytime()));
            mmap.put("apply", apply);
            mmap.put("taskid", taskid);
        }
        return prefix + "/manager";
    }

    /**
     * 出纳付款
     */
    @GetMapping("/pay")
    public String pay(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("applyTime", sdf.format(apply.getApplytime()));
            mmap.put("apply", apply);
            mmap.put("taskid", taskid);
        }
        return prefix + "/pay";
    }

    /**
     * 收货确认
     */
    @GetMapping("/receiveitem")
    public String receiveitem(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("applyTime", sdf.format(apply.getApplytime()));
            mmap.put("apply", apply);
            mmap.put("taskid", taskid);
        }
        return prefix + "/receiveitem";
    }

    /**
     * 调整申请
     */
    @GetMapping("/updateapply")
    public String updateapply(String taskid, ModelMap mmap)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            mmap.put("applyTime", sdf.format(apply.getApplytime()));
            mmap.put("apply", apply);
            mmap.put("taskid", taskid);
        }
        return prefix + "/updateapply";
    }
}
