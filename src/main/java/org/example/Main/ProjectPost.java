package org.example.Main;

import jakarta.persistence.*;
import jakarta.transaction.Transactional;
import lombok.*;

import java.time.LocalDateTime;



@ToString
@Table(name="project_posts")
@Builder
@Entity
@AllArgsConstructor
@Getter
public class ProjectPost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private String content;

    @Enumerated(EnumType.STRING)
    @Column(name = "project_post_status")
    private ProjectPostStatus projectPostStatus;

    @Column(name = "created_at", insertable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "modified_at", insertable = false, updatable = false)
    private LocalDateTime modifiedAt;

    @Column(name = "deleted_at")
    private LocalDateTime deletedAt;

    @Column(name = "creator_id")
    private Long creatorId;

    public ProjectPost() {

    }

    @Transactional
    public void modifyProjectPost(String title, String content, ProjectPostStatus projectPostStatus) {
        this.title = title;
        this.content = content;
        this.projectPostStatus = projectPostStatus;
    }
    // getter, setter 생략
}
