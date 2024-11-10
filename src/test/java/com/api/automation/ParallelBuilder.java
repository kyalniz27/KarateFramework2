package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner.Builder;

public class ParallelBuilder {
	
	@Test
	public void ExecuteKarateTest() {
		Builder aRunner = new Builder();
		aRunner.path("classpath:src/test/java");
		aRunner.parallel(5);
	}

}
