# .hack System CC - AIDA Network Anomaly Telemetry Script
# Detects rapid connection spikes or scanning patterns across ALTIMIT subnets

module AIDA_Monitor;

redef log_requests = T;

event connection_established(c: connection)
{
    # Check if traffic originates from the rogue network zone
    if ( c$id$orig_h in 172.28.30.0/24 )
    {
        print cat("ALTIMIT_TELEMETRY: Rogue node activity detected from IP: ", c$id$orig_h, " -> Target: ", c$id$resp_h);
    }
}
