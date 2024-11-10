package com.api.automation.tags;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import static org.junit.jupiter.api.Assertions.*;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

public class TestRunnerForTags {
	
	private static final String CLASS_PATH = "classpath";

	@Test
	public void ParallelTests() {
		Results results = Runner.path("classpath:com/api/automation/tags").tags("~@ignore").parallel(5);
		generateCucumberReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
		
	}
	
	//C:\Users\mustafa.koklu\eclipse-workspace\KarateFramework\target\surefire-reports
	 private void generateCucumberReport(String reportDirLocation) {
     	
	    	File reportDirFile = new File(reportDirLocation);
	    	Collection<File> jsonCollection = FileUtils.listFiles(reportDirFile, new String[] {"json"},  true);
	    	
	    	List<String> jsonFiles = new ArrayList<String>();
	    	jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
	    	
	    	Configuration configuration = new Configuration(reportDirFile, "Karate Run");
	    	ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
	    	reportBuilder.generateReports();
	    	
	    }
	
	//With this approach below you can specify the dynamic values with variables for location and tags
//	private List<String> getTags(){
//		String aTags = System.getProperty("tags","@Confidence");
//		List<String> aTagList = Arrays.asList(aTags);
//		return aTagList;
//	}
//	
//	private List<String> getLocation(){
//		String aLocation = System.getProperty("location", "com/api/automation/tags");
//		List<String> aLocationList = Arrays.asList(CLASS_PATH + aLocation);
//		return aLocationList;
//	}
	
	

}
