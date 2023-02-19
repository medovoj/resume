package com.medovoy.resume.repository.search;

import com.medovoy.resume.entity.Profile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface ProfileSearchRepository extends ElasticsearchRepository<Profile, Long> {

    Page<Profile> findByObjectiveLikeOrSummaryLikeOrPracticesCompanyLikeOrPracticesPositionLike(
            String objective, String summary, String practiceCompany, String practicePosition, Pageable pageable);

}