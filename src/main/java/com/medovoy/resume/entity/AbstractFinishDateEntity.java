package com.medovoy.resume.entity;

import org.joda.time.DateTime;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;
import java.util.Date;

@MappedSuperclass
public abstract class AbstractFinishDateEntity<T> extends AbstractEntity<T> {

    @Column(name = "end_date")
    private Date endDate;

    @Transient
    private Integer finishDateMonth;

    @Transient
    private Integer finishDateYear;

    public Date getEndDate() {
        return endDate;
    }

    public void setFinishDate(Date finishDate) {
        this.endDate = finishDate;
    }

    @Transient
    public boolean isFinish() {
        return endDate != null;
    }

    @Transient
    public Integer getFinishDateMonth() {
        if (endDate != null) {
            return new DateTime(endDate).getMonthOfYear();
        } else {
            return null;
        }
    }

    @Transient
    public Integer getFinishDateYear() {
        if (endDate != null) {
            return new DateTime(endDate).getYear();
        } else {
            return null;
        }
    }

    public void setFinishDateMonth(Integer finishDateMonth) {
        this.finishDateMonth = finishDateMonth;
        setupFinishDate();
    }

    public void setFinishDateYear(Integer finishDateYear) {
        this.finishDateYear = finishDateYear;
        setupFinishDate();
    }

    private void setupFinishDate() {
        if (finishDateYear != null && finishDateMonth != null) {
            setFinishDate(new Date(new DateTime(finishDateYear, finishDateMonth, 1, 0, 0).getMillis()));
        } else {
            setFinishDate(null);
        }
    }
}

