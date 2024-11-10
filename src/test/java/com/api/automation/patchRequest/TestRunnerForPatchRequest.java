package com.api.automation.patchRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunnerForPatchRequest {

	@Test
    Karate testUsers() {
        return Karate.run("updateJobDescription").relativeTo(getClass());
    }    

}
