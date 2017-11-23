package pubgapi.enums;

/**
 * Created by Łukasz "Husar" Górny on 2017-06-29.
 * Added Full Region Names by Timothy "Tim3Game" Beihofner on 2017-09-24.
 */
public enum PUBGRegion {
    agg("All Regions Combined"),
    na("North America"),
    eu("Europe"),
    as("Asia"),
    oc("Oceania"),
    sa("South America"),
    sea("South East Asia"),
    krjp("Korea/Japan");

    private final String regionName;

    PUBGRegion(String regionName) {
        this.regionName = regionName;
    }

    public String getRegionName() {
        return regionName;
    }
}
