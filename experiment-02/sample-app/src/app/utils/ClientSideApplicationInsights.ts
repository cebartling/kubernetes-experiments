'use client';

import { ApplicationInsights } from '@microsoft/applicationinsights-web';

export const appInsights = new ApplicationInsights({
  config: {
    connectionString: 'YOUR_CONNECTION_STRING_GOES_HERE',
    /* ...Other Configuration Options... */
  },
});
appInsights.loadAppInsights();
appInsights.trackPageView(); // Manually call trackPageView to establish the current user/session/pageview
