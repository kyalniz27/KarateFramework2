package com.api.automation.putRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunnerForPut {

	@Test
    Karate testUsers() {
        return Karate.run("updateJobEntry").relativeTo(getClass());
    }    

}
