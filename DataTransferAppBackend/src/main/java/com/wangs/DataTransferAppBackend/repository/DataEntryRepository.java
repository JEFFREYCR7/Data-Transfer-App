package com.wangs.DataTransferAppBackend.repository;

import com.wangs.DataTransferAppBackend.entity.DataEntryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataEntryRepository extends JpaRepository<DataEntryEntity, Long> {

}
