package com.course.business.controller.admin;

import com.course.server.dto.ChapterDto;
import com.course.server.dto.PageDto;
import com.course.server.dto.ResponseDto;
import com.course.server.service.ChapterService;
import com.course.server.util.ValidatorUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/admin/chapter")
public class ChapterController {
    private static final Logger log = LoggerFactory.getLogger(ChapterController.class);
    public static final String BUSINESS_NAME = "大章";
    @Resource
    private ChapterService chapterService;
    @PostMapping("/list")
    public ResponseDto list(@RequestBody PageDto pageDto) {
        ResponseDto responseDto = new ResponseDto();
         chapterService.list(pageDto);
         log.info("测试pageDto:{}",pageDto);
         responseDto.setContent(pageDto);
//        System.out.println(pageDto.getList());
         return responseDto;
    }

    @PostMapping("/save")
    public ResponseDto save(@RequestBody ChapterDto chapterDto){
        log.info("测试chapterDto:{}",chapterDto);
        ResponseDto responseDto = new ResponseDto();
        //保存校验
            ValidatorUtil.require(chapterDto.getName(),"名称");
            ValidatorUtil.require(chapterDto.getCourseId(),"课程ID");
            ValidatorUtil.length(chapterDto.getCourseId(),"课程ID",1,8);
        chapterService.save(chapterDto);
        responseDto.setContent(chapterDto);
        return responseDto;
    }

    @RequestMapping("/delete/{id}")
    public ResponseDto delete (@PathVariable String id) {
        ResponseDto responseDto = new ResponseDto();
        log.info("测试id:{}",id);
        chapterService.delete(id);
        return responseDto;
    }

}
