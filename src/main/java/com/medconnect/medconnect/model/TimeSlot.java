package com.medconnect.medconnect.model;

import com.medconnect.medconnect.model.enums.TimeSlotStatus;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
public class TimeSlot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "specialist_id", referencedColumnName = "id")
    private Specialist specialist;

    private LocalDateTime startTime;
    private LocalDateTime endTime;

    @Enumerated(EnumType.STRING)
    private TimeSlotStatus status;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "expertise_request_id")
    private ExpertiseRequest expertiseRequest;

    // Default constructor
    public TimeSlot() {}

    public TimeSlot(int id, Specialist specialist, LocalDateTime startTime, LocalDateTime endTime, TimeSlotStatus status) {
        this.id = id;
        this.specialist = specialist;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
    }

    // Getters
    public int getId() { return id; }
    public Specialist getSpecialist() { return specialist; }
    public LocalDateTime getStartTime() { return startTime; }
    public LocalDateTime getEndTime() { return endTime; }
    public TimeSlotStatus getStatus() { return status; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setSpecialist(Specialist specialist) { this.specialist = specialist; }
    public void setStartTime(LocalDateTime startTime) { this.startTime = startTime; }
    public void setEndTime(LocalDateTime endTime) { this.endTime = endTime; }
    public void setStatus(TimeSlotStatus status) { this.status = status; }
}
