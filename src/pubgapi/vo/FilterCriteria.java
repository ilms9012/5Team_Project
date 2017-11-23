package pubgapi.vo;

import pubgapi.enums.PUBGMode;
import pubgapi.enums.PUBGRegion;
import pubgapi.enums.PUBGSeason;

/**
 * Created by Łukasz "Husar" Górny on 2017-07-11.
 */
public class FilterCriteria {
    private PUBGMode mode = null;
    private PUBGRegion region = null;
    private PUBGSeason season = null;

    public FilterCriteria(final PUBGMode mode, final PUBGRegion region, final PUBGSeason season) {
        this.mode = mode;
        this.region = region;
        this.season = season;
    }

    public FilterCriteria() {}

    public PUBGMode getMode() {
        return mode;
    }

    public void setMode(PUBGMode mode) {
        this.mode = mode;
    }

    public PUBGRegion getRegion() {
        return region;
    }

    public void setRegion(PUBGRegion region) {
        this.region = region;
    }

    public PUBGSeason getSeason() {
        return season;
    }

    public void setSeason(PUBGSeason season) {
        this.season = season;
    }
}
