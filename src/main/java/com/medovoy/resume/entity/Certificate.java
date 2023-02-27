package com.medovoy.resume.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.medovoy.resume.constrain.annotation.EnglishLanguage;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "certificate", schema = "resume", catalog = "resume")
public class Certificate extends AbstractEntity<Long> implements Serializable, ProfileEntity  {
    @Id
    @SequenceGenerator(name = "PROFILE_ID_GENERATOR", sequenceName = "PROFILE_SEQ", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROFILE_ID_GENERATOR")
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(nullable = false, length = 50)
    @EnglishLanguage
    private String name;

    @Column(name = "large_url", nullable = false)
    private String largeUrl;

    @Column(name = "small_url", nullable = false)
    private String smallUrl;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLargeUrl() {
        return largeUrl;
    }

    public void setLargeUrl(String largeUrl) {
        this.largeUrl = largeUrl;
    }

    public String getSmallUrl() {
        return smallUrl;
    }

    public void setSmallUrl(String smallUrl) {
        this.smallUrl = smallUrl;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Certificate that = (Certificate) o;

        if (!Objects.equals(id, that.id)) return false;
        if (!Objects.equals(name, that.name)) return false;
        if (!Objects.equals(largeUrl, that.largeUrl)) return false;
        return Objects.equals(smallUrl, that.smallUrl);
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (largeUrl != null ? largeUrl.hashCode() : 0);
        result = 31 * result + (smallUrl != null ? smallUrl.hashCode() : 0);
        return result;
    }

    @Override
    public void setProfile(Profile profile) {
        this.profile = profile;
    }


}
