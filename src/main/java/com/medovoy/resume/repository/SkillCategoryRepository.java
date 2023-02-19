package com.medovoy.resume.repository;

import com.medovoy.resume.entity.SkillCategory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.RepositoryDefinition;

import java.util.List;


@RepositoryDefinition(domainClass=SkillCategory.class, idClass=Long.class)
public interface SkillCategoryRepository {

    List<SkillCategory> findAll();
}
