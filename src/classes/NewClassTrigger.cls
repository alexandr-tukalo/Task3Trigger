public class NewClassTrigger {
	
    public NewClassTrigger(List<Lead> newLead){
           
	Set<String> setSource = new Set<String>();
        for (Lead st : newLead)  {
            setSource.add(st.LeadSource);
        }
     
        if (setSource.size() > 0) {
    /*    Map<String, Campaign> mapCampaign = new Map<String, Campaign>([
           SELECT Name, (SELECT Id, Name, StartDate, EndDate FROM ChildCampaigns) FROM Campaign
           WHERE Name IN :setSource
        ]);*/
            
        Map<String, Campaign> mapCampaign = new Map<String, Campaign>();
            
			for(Campaign c: [ SELECT Name, (SELECT Id, Name, StartDate, EndDate FROM ChildCampaigns) 
                              FROM Campaign
           					  WHERE Name IN :setSource] ){
  				mapCampaign.put(c.Name, c);
            }    
            
        List<CampaignMember> cm = new List<CampaignMember>();
            
        for (Lead l : newLead) {
            if (!mapCampaign.containsKey(l.LeadSource)) {
                l.addError('This campaign:('+l.LeadSource+') does not exist'); 
                continue;
            }
            for(Campaign c : mapCampaign.get(l.LeadSource).ChildCampaigns){
            	if (c.StartDate.month() == l.CreatedDate.month()) {
                	cm.add(new CampaignMember(CampaignID = mapCampaign.get(l.LeadSource).Id, LeadId = l.Id));  
            	} 
            }
        }
        insert cm; 
    }
    
   }
}