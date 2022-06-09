package com.ruoyi.web.controller.activiti.explorer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class EditorController {


    /** 流程图编辑器
     * @return
     */
    @GetMapping("editor")
    public String editor() {
        return "modeler";
    }

}
