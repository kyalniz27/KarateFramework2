package com.api.automation;

import com.api.automation.config.report.CustomExtentReport;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import static org.junit.jupiter.api.Assertions.*;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

class ParallelRunnerForExtentReports {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:com/api/automation/post").parallel(5);
        //Extent Report
        CustomExtentReport extentReport = new CustomExtentReport()
        		.withKarateResult(results)
        		.withReportDir(results.getReportDir())
        		.withReportTitle("Karate Test Execution Report");
        
        
        //generateCucumberReport(results.getReportDir());
        //assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    //reportDirLocation --> C:\Users\mustafa.koklu\eclipse-workspace\KarateFramework\target
//    private void generateCucumberReport(String reportDirLocation) {
//        	
//    	File reportDirFile = new File(reportDirLocation);
//    	Collection<File> jsonCollection = FileUtils.listFiles(reportDirFile, new String[] {"json"},  true);
//    	
//    	List<String> jsonFiles = new ArrayList<String>();
//    	jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
//    	
//    	Configuration configuration = new Configuration(reportDirFile, "Karate Run");
//    	ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
//    	reportBuilder.generateReports();
//    	
//    }

}