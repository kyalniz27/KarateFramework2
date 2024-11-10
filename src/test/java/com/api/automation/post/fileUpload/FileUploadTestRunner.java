package com.api.automation.post.fileUpload;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class FileUploadTestRunner {

	@Test
    Karate testUsers() {
        return Karate.run("fileUpload").relativeTo(getClass());
    }    

}
