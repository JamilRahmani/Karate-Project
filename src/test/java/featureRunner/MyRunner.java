package featureRunner;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class MyRunner {
	
	@Test
	public Karate runFeatures() {
		
		return Karate.run("End2End").tags("@Test").relativeTo(getClass());
	}

}
