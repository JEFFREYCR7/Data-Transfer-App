package com.wangs.DataTransferAppBackend.controller;

import com.wangs.DataTransferAppBackend.entity.DataEntryEntity;
import com.wangs.DataTransferAppBackend.repository.DataEntryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("api/data")
public class DataEntryController {


    @Autowired
    private DataEntryRepository dataEntryRepository;

    // POST方法用于接收数据并保存
    @PostMapping
    public ResponseEntity<DataEntryEntity> createDataEntry(@RequestBody DataEntryEntity dataEntryEntity) {
        dataEntryEntity.setTimeStamp(LocalDateTime.now());
        DataEntryEntity savedEntry = dataEntryRepository.save(dataEntryEntity);
        return ResponseEntity.ok(savedEntry);
    }

    // GET方法用于获取所有数据
    @GetMapping
    public List<DataEntryEntity> getAllDataEntry() {
        return dataEntryRepository.findAll();
    }
}
