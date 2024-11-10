package com.api.automation.post.dataDriven;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunnerDataDriven {

	@Test
    Karate testUsers() {
        return Karate.run("postDataDriven").relativeTo(getClass());
    }    

}
