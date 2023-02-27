package com.medovoy.resume.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.medovoy.resume.constrain.annotation.EnglishLanguage;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "education", schema = "resume", catalog = "resume")
public class Education extends AbstractEntity<Long>  implements Serializable, ProfileEntity {

    @Id
    @SequenceGenerator(name="EDUCATION_ID_GENERATOR", sequenceName="EDUCATION_SEQ", allocationSize=1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="EDUCATION_ID_GENERATOR")
    @Column(unique=true, nullable=false)
    private Long id;

    @Column(nullable=false, length=255)
    @EnglishLanguage
    private String faculty;

    @Column(nullable=false, length=100)
    @EnglishLanguage
    private String summary;

    @Column(nullable=false, length=2147483647)
    @EnglishLanguage
    private String university;

    @Column(name="begin_year", nullable=false)
    private Integer beginYear;

    @Column(name="finish_year")
    private Integer finishYear;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_profile", nullable=false)
    @JsonIgnore
    private Profile profile;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public int getBeginYear() {
        return beginYear;
    }

    public void setBeginYear(int beginYear) {
        this.beginYear = beginYear;
    }

    public Integer getFinishYear() {
        return finishYear;
    }

    public void setFinishYear(Integer finishYear) {
        this.finishYear = finishYear;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Education that = (Education) o;

        if (!Objects.equals(id, that.id)) return false;
        if (!Objects.equals(beginYear, that.beginYear)) return false;
        if (!Objects.equals(summary, that.summary)) return false;
        if (!Objects.equals(finishYear, that.finishYear)) return false;
        if (!Objects.equals(university, that.university)) return false;
        return Objects.equals(faculty, that.faculty);
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (summary != null ? summary.hashCode() : 0);
        result = 31 * result + beginYear;
        result = 31 * result + (finishYear != null ? finishYear.hashCode() : 0);
        result = 31 * result + (university != null ? university.hashCode() : 0);
        result = 31 * result + (faculty != null ? faculty.hashCode() : 0);
        return result;
    }

    @Override
    public void setProfile(Profile profile) {
        this.profile = profile;
    }
}
