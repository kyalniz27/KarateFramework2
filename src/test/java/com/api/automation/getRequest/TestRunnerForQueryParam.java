package com.api.automation.getRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunnerForQueryParam {

	@Test
    Karate testUsers() {
        return Karate.run("queryParameter").relativeTo(getClass());
    }    

}
