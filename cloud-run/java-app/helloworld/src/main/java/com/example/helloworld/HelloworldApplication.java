
package com.example.helloworld;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.FirestoreOptions;

import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;

import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.WriteResult;
import com.google.common.collect.ImmutableMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootApplication
public class HelloworldApplication {

  @Value("${NAME:World}")
  String name;

  @RestController
  class HelloworldController {
    @GetMapping("/")
    String hello() {
      return "Hello " + name + "!";
    }
    @GetMapping("/test")
    String test() {
      return "This is an testing endpoint!";
    }
  }

  public static void main(String[] args) throws Exception {
    SpringApplication.run(HelloworldApplication.class, args);

    FirestoreOptions firestoreOptions =
    FirestoreOptions.getDefaultInstance().toBuilder()
        .setProjectId("divine-ceremony-167109")
        .setDatabaseId("db-test-firestore") 
        .setCredentials(GoogleCredentials.getApplicationDefault())
        .build();
    Firestore db = firestoreOptions.getService();

    // [START firestore_setup_dataset_read]
    // asynchronously retrieve all users
    ApiFuture<QuerySnapshot> query = db.collection("tasks").get();
    // ...
    // query.get() blocks on response
    QuerySnapshot querySnapshot = query.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.getDocuments();
    for (QueryDocumentSnapshot document : documents) {
      System.out.println("User: " + document.getId() + " Data" + document.getData());
    }
  }
}