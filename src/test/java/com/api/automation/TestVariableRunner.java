package com.api.automation;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestVariableRunner {

	@Test
    Karate testUsers() {
        return Karate.run("validationUsingFile").relativeTo(getClass());
    }    

}
