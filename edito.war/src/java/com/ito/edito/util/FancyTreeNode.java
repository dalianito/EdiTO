package com.ito.edito.util;

import java.util.List;

public class FancyTreeNode {
    private String title;
    private String key;
    private List<FancyTreeNode> children;
    private boolean expanded;
    private boolean lazy;

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }
    public boolean isLazy() {
        return lazy;
    }
    public void setLazy(boolean lazy) {
        this.lazy = lazy;
    }
    public List<FancyTreeNode> getChildren() {
        return children;
    }
    public void setChildren(List<FancyTreeNode> children) {
        this.children = children;
    }
    public boolean isExpanded() {
        return expanded;
    }
    public void setExpanded(boolean expanded) {
        this.expanded = expanded;
    }
}
