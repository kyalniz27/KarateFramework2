package com.api.automation;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunner {

	@Test
    Karate testUsers() {
        return Karate.run("fileUpload").relativeTo(getClass());
    }    

}
