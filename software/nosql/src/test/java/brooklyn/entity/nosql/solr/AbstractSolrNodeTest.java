/*
 * Copyright 2012-2013 by Cloudsoft Corp.
 */
package brooklyn.entity.nosql.solr;

import org.testng.annotations.BeforeMethod;

import brooklyn.entity.BrooklynMgmtContextTestSupport;
import brooklyn.location.Location;

/**
 * Solr test framework for integration and live tests.
 */
public class AbstractSolrNodeTest extends BrooklynMgmtContextTestSupport {

    protected Location testLocation;
    protected SolrNode solr;

    @BeforeMethod(alwaysRun = true)
    public void setUp() throws Exception {
        super.setUp();
        testLocation = app.newLocalhostProvisioningLocation();
    }

}
