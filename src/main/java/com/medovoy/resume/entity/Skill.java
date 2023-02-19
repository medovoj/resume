package com.medovoy.resume.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.medovoy.resume.constrain.annotation.EnglishLanguage;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "skill", schema = "resume", catalog = "resume")
public class Skill implements Serializable, ProfileEntity {
    @Id
    @SequenceGenerator(name="SKILL_ID_GENERATOR", sequenceName="SKILL_SEQ", allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SKILL_ID_GENERATOR")
    @Column(unique=true, nullable=false)
    private Long id;

    @Column(nullable=false, length=50)
    @Size(min = 1)
    @EnglishLanguage
    private String category;

    @Column(nullable=false, length=2147483647)
    @EnglishLanguage
    private String value;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_profile", nullable=false)
    @JsonIgnore
    private Profile profile;

    public Skill() {
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategory() {
        return this.category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getValue() {
        return this.value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Profile getProfile() {
        return this.profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Skill that = (Skill) o;

        if (id != that.id) return false;
        if (!Objects.equals(category, that.category)) return false;
        return Objects.equals(value, that.value);
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (value != null ? value.hashCode() : 0);
        return result;
    }
}
