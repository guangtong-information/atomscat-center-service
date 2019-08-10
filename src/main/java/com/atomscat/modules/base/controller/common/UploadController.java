package com.atomscat.modules.base.controller.common;

import cn.hutool.core.util.StrUtil;
import com.atomscat.common.utils.Base64DecodeMultipartFile;
import com.atomscat.common.utils.ResultUtil;
import com.atomscat.common.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;

/**
 * @author Howell.Yang
 */
@Slf4j
@RestController
@Api(description = "文件上传接口")
@RequestMapping("/api/upload")
@Transactional
public class UploadController {


    @RequestMapping(value = "/file",method = RequestMethod.POST)
    @ApiOperation(value = "文件上传")
    public Result<Object> upload(@RequestParam(required = false) MultipartFile file,
                                 @RequestParam(required = false) String base64,
                                 HttpServletRequest request) {

        if(StrUtil.isNotBlank(base64)){
            // base64上传
            file = Base64DecodeMultipartFile.base64Convert(base64);
        }
        String result = null;
        //todo get fileName
        String fileName = file.getOriginalFilename();
        try {
            InputStream inputStream = file.getInputStream();
            //上传OSS服务器 todo
            //result = xxx(inputStream,fileName);
        } catch (Exception e) {
            log.error(e.toString());
            return new ResultUtil<Object>().setErrorMsg(e.toString());
        }

        return new ResultUtil<Object>().setData(result);
    }
}
