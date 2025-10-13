package com.medconnect.medconnect.model;

import com.medconnect.medconnect.model.enums.ExpertiseRequestStatus;
import com.medconnect.medconnect.model.enums.Priority;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "expertise_requests")
public class ExpertiseRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne(mappedBy = "expertiseRequest", fetch = FetchType.LAZY)
    private Consultation consultation;

    @OneToOne(mappedBy = "expertiseRequest", fetch = FetchType.LAZY)
    private Specialist specialist;


    private String question;

    @Enumerated(EnumType.STRING)
    private ExpertiseRequestStatus status;

    @Enumerated(EnumType.STRING)
    private Priority priority;

    private LocalDateTime dateRequested;
    private String recommendations;

    @OneToOne(mappedBy = "expertiseRequest", fetch = FetchType.LAZY)
    private TimeSlot timeSlot;

    // Default constructor
    public ExpertiseRequest() {}

    public ExpertiseRequest(Consultation consultation, Specialist specialist, String question, ExpertiseRequestStatus status, Priority priority, LocalDateTime dateRequested, String recommendations, TimeSlot timeSlot) {
        this.consultation = consultation;
        this.specialist = specialist;
        this.question = question;
        this.status = status;
        this.priority = priority;
        this.dateRequested = dateRequested;
        this.recommendations = recommendations;
        this.timeSlot = timeSlot;
    }

    // Getters
    public int getId() { return id; }
    public Consultation getConsultation() { return consultation; }
    public Specialist getSpecialist() { return specialist; }
    public String getQuestion() { return question; }
    public ExpertiseRequestStatus getStatus() { return status; }
    public Priority getPriority() { return priority; }
    public LocalDateTime getDateRequested() { return dateRequested; }
    public String getRecommendations() { return recommendations; }
    public TimeSlot getTimeSlot() { return timeSlot;}

    // Setters
    public void setId(int id) { this.id = id; }
    public void setConsultation(Consultation consultation) { this.consultation = consultation; }
    public void setSpecialist(Specialist specialist) { this.specialist = specialist; }
    public void setQuestion(String question) { this.question = question; }
    public void setStatus(ExpertiseRequestStatus status) { this.status = status; }
    public void setPriority(Priority priority) { this.priority = priority; }
    public void setDateRequested(LocalDateTime dateRequested) { this.dateRequested = dateRequested; }
    public void setRecommendations(String recommendations) { this.recommendations = recommendations; }
    public void setTimeSlot(TimeSlot timeSlot) { this.timeSlot = timeSlot; }


}
