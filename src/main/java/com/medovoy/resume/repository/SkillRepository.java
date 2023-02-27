package com.medovoy.resume.repository;

import com.medovoy.resume.entity.Skill;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface SkillRepository extends PagingAndSortingRepository<Skill, Long> {

    Iterable<Skill> findBy(Long id);


}
