package org.example.Main;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@Transactional
public class DataTestRunner implements CommandLineRunner {

    @Autowired
    private final ProjectPostRepository projectPostRepository;

    public DataTestRunner(ProjectPostRepository projectPostRepository) {
        this.projectPostRepository = projectPostRepository;
    }


    @Override
    public void run(String... args) {
        /*
        ProjectPost post = ProjectPost.builder()
                .title("테스트 제목")
                .content("테스트 내용")
                .projectPostStatus(ProjectPostStatus.NOTIFICATION)
                .creatorId(1L)
                .build();

        projectPostRepository.save(post);

        System.out.println("저장 완료: ");

         */


        Long postIdToUpdate = 2L;
        ProjectPost post = projectPostRepository.findById(postIdToUpdate)
                .orElseThrow(() -> new IllegalArgumentException("해당 ID의 게시글이 없습니다: " + postIdToUpdate));
        post.modifyProjectPost("수정된 제목", "수정된 내용", ProjectPostStatus.NOTIFICATION);

        System.out.println(post.getTitle());


    }
}

