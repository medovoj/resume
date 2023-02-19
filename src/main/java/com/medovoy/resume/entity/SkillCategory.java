package com.medovoy.resume.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "skill_category", schema = "resume", catalog = "resume")
public class SkillCategory {

    @Id
    @Column
    private Long id;

    @Column(nullable=false, length=50)
    private String category;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SkillCategory that = (SkillCategory) o;

        if (!Objects.equals(id, that.id)) return false;
        return Objects.equals(category, that.category);
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (category != null ? category.hashCode() : 0);
        return result;
    }
}
