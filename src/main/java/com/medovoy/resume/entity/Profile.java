package com.medovoy.resume.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.medovoy.resume.constrain.annotation.EnglishLanguage;
import org.hibernate.validator.constraints.Email;
import org.joda.time.LocalDate;
import org.joda.time.Years;
import org.springframework.data.elasticsearch.annotations.Document;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "profile", schema = "resume", catalog = "resume")
@Document(indexName = "profile")
public class Profile extends AbstractEntity<Long> implements Serializable {

    @Id
    @SequenceGenerator(name = "PROFILE_ID_GENERATOR", sequenceName = "PROFILE_SEQ", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROFILE_ID_GENERATOR")
    @Column(unique = true, nullable = false)
    private Long id;

    @Column(nullable = false, length = 50)
    private String uid;

    @Column(name = "first_name", nullable = false, length = 50)
    @EnglishLanguage
    private String firstName;

    @Column(name = "last_name", nullable = false, length = 50)
    @EnglishLanguage
    private String lastName;

    @Column
    private Date birthday;

    @Column
    @EnglishLanguage
    private String country;

    @Column
    @EnglishLanguage
    private String city;

    @Column
    @Email
    private String email;

    @Column
    private String phone;

    @Column(length = 2147483647)
    @EnglishLanguage
    private String objective;

    @Column(length = 2147483647)
    @EnglishLanguage
    private String summary;

    @Column(name = "small_photo")
    private String smallPhoto;

    @Column(name = "large_photo")
    @JsonIgnore
    private String largePhoto;

    @Column
    @EnglishLanguage
    private String info;

    @Column(nullable = false, length = 50)
    @JsonIgnore
    private String password;

    @Column(nullable = false)
    @JsonIgnore
    private boolean completed;

    @Column(insertable = false)
    @JsonIgnore
    private Timestamp created;

    @OneToMany(mappedBy = "profile", cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    private List<Certificate> certificates;

    @OneToMany(mappedBy = "profile", cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @OrderBy("finishYear DESC, beginYear DESC, id DESC")
    private List<Education> educations;

    @OneToMany(mappedBy = "profile", cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @OrderBy("name ASC")
    @JsonIgnore
    private List<Hobby> hobbies;

    @OneToMany(mappedBy = "profile", cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    private List<Language> languages;

    @OneToMany(mappedBy = "profile", cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @OrderBy("endDate DESC")
    private List<Practice> practices;

    @OneToMany(mappedBy = "profile", cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @OrderBy("id ASC")
    private List<Skill> skills;

    @OneToMany(mappedBy = "profile", cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @OrderBy("endDate DESC")
    private List<Course> courses;

    @Embedded
    private Contacts contacts;


    public Profile() {
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getBirthDay() {
        return this.birthday;
    }

    public void setBirthDay(Date birthDay) {
        this.birthday = birthDay;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return this.country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getObjective() {
        return this.objective;
    }

    public void setObjective(String objective) {
        this.objective = objective;
    }

    public String getSummary() {
        return this.summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getUid() {
        return this.uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public List<Certificate> getCertificates() {
        return this.certificates;
    }

    public void setCertificates(List<Certificate> certificates) {
        this.certificates = certificates;
        updateListSetProfile(this.certificates);
    }

    public List<Education> getEducations() {
        return this.educations;
    }

    public void setEducations(List<Education> educations) {
        this.educations = educations;
        updateListSetProfile(this.educations);
    }

    public List<Hobby> getHobbies() {
        return this.hobbies;
    }

    public void setHobbies(List<Hobby> hobbies) {
        this.hobbies = hobbies;
        updateListSetProfile(this.hobbies);
    }

    public List<Language> getLanguages() {
        return this.languages;
    }

    public void setLanguages(List<Language> languages) {
        this.languages = languages;
//        updateListSetProfile(this.languages);
    }

    public List<Practice> getPractices() {
        return this.practices;
    }

    public void setPractices(List<Practice> practices) {
        this.practices = practices;
        updateListSetProfile(this.practices);

    }

    public List<Skill> getSkills() {
        return this.skills;
    }

    public void setSkills(List<Skill> skills) {
        this.skills = skills;
        updateListSetProfile(this.skills);
    }


    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {

        this.courses = courses;
        updateListSetProfile(this.courses);

    }

    public String getLargePhoto() {
        return largePhoto;
    }

    public void setLargePhoto(String largePhoto) {
        this.largePhoto = largePhoto;
    }

    public String getSmallPhoto() {
        return smallPhoto;
    }

    public void setSmallPhoto(String smallPhoto) {
        this.smallPhoto = smallPhoto;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    @Transient
    public String getFullName() {
        return firstName + " " + lastName;
    }

    @Transient
    public int getAge() {
        LocalDate birthdate = new LocalDate(birthday);
        LocalDate now = new LocalDate();
        Years age = Years.yearsBetween(birthdate, now);
        return age.getYears();
    }

    @Transient
    public String getProfilePhoto() {
        if (largePhoto != null) {
            return largePhoto;
        } else {
            return "/static/img/profile-placeholder.png";
        }
    }

    public String updateProfilePhotos(String largePhoto, String smallPhoto) {
        String oldLargeImage = this.largePhoto;
        setLargePhoto(largePhoto);
        setSmallPhoto(smallPhoto);
        return oldLargeImage;
    }

    private void updateListSetProfile(List<? extends ProfileEntity> list) {
        if (list != null) {
            for (ProfileEntity entity : list) {
                entity.setProfile(this);
            }
        }
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Contacts getContacts() {
        if (contacts == null) {
            contacts = new Contacts();
        }
        return contacts;
    }

    public void setContacts(Contacts contacts) {
        this.contacts = contacts;
    }
}

