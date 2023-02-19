package com.medovoy.resume.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.medovoy.resume.constrain.annotation.EnglishLanguage;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "practice", schema = "resume", catalog = "resume")
public class Practice extends AbstractFinishDateEntity<Long> implements Serializable, ProfileEntity {
    @Id
    @SequenceGenerator(name = "PRACTICE_ID_GENERATOR", sequenceName = "PRACTICE_SEQ", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PRACTICE_ID_GENERATOR")
    @Column(unique = true, nullable = false)
    private Long id;

    @Column(nullable = false, length = 100)
    @EnglishLanguage
    private String company;

    @Column(length = 255)
    private String demo;

    @Column(length = 255)
    private String src;

    @Column(nullable = false, length = 100)
    @EnglishLanguage
    private String position;

    @Column(nullable = false, length = 2147483647)
    @EnglishLanguage
    private String responsibilities;

    @Column(name = "begin_date", nullable = false)
    private Date beginDate;

    @Transient
    private Integer beginDateMonth;

    @Transient
    private Integer beginDateYear;

    // bi-directional many-to-one association to Profile
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_profile", nullable = false)
    @JsonIgnore
    private Profile profile;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }


    public String getDemo() {
        return demo;
    }

    public void setDemo(String demo) {
        this.demo = demo;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getResponsibilities() {
        return responsibilities;
    }

    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Practice that = (Practice) o;

        if (!Objects.equals(id, that.id)) return false;
        if (!Objects.equals(position, that.position)) return false;
        if (!Objects.equals(company, that.company)) return false;
        if (!Objects.equals(beginDate, that.beginDate)) return false;
        if (!Objects.equals(demo, that.demo)) return false;
        return Objects.equals(src, that.src);
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (position != null ? position.hashCode() : 0);
        result = 31 * result + (company != null ? company.hashCode() : 0);
        result = 31 * result + (beginDate != null ? beginDate.hashCode() : 0);
        result = 31 * result + (demo != null ? demo.hashCode() : 0);
        result = 31 * result + (src != null ? src.hashCode() : 0);
        return result;
    }

    @Override
    public void setProfile(Profile profile) {
        this.profile = profile;
    }
}
