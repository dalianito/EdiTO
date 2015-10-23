package com.ito.edito.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FlotLineChartData {
    private List<List<Integer>> data;
    private String label;
    
    public void addDataPoint(int index, int value) {
        if (data == null) {
            data = new ArrayList<List<Integer>>();
        }
        
        data.add(Arrays.asList(index, value));
    }

    public List<List<Integer>> getData() {
        return data;
    }
    public void setData(List<List<Integer>> data) {
        this.data = data;
    }
    public String getLabel() {
        return label;
    }
    public void setLabel(String label) {
        this.label = label;
    }
}
