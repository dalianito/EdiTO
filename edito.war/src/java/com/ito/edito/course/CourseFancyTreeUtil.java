package com.ito.edito.course;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Course;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.edito.util.FancyTreeNode;
import com.ito.fai.util.JndiFactory;

public class CourseFancyTreeUtil {

    public static List<FancyTreeNode> formatCourseDataInFancyTree(List<String> uuids) throws RemoteException, Exception {
        if (uuids == null || uuids.size() == 0){
            return null;
        }
        ClassService classService = (ClassService) JndiFactory.lookup("classService");

        HashMap<String, FancyTreeNode> nodesMap =  new HashMap<String, FancyTreeNode>();
        List<String> topLevelNodeUuids = new ArrayList<String>();
        FancyTreeNode lastNode = null;
        for (String uuid : uuids){
            while (uuid != null && uuid.length() == 32){
                System.out.println(uuid);
                if (nodesMap.containsKey(uuid)){
                    FancyTreeNode node = nodesMap.get(uuid);
                    node.setExpanded(true);
                    node.setLazy(false);
                    if (lastNode != null) {
                        if (node.getChildren() == null) {
                            node.setChildren(new ArrayList<FancyTreeNode>());
                        }
                        node.getChildren().add(lastNode);
                    }
                    lastNode = null;
                    break;
                }

                CourseCategoryType type = classService.selectCourseCategoryTypeByUuid(uuid);
                if (type != null) {
                    FancyTreeNode node = new FancyTreeNode();
                    node.setKey(type.getUuid());
                    node.setTitle(type.getDescription());
                    if (lastNode != null) {
                        node.setChildren(new ArrayList<FancyTreeNode>());
                        node.getChildren().add(lastNode);
                        node.setExpanded(true);
                    }
                    nodesMap.put(uuid, node);
                    uuid = type.getParentUuid();
                    lastNode = node;
                } else {
                    Course course = classService.selectCourseByUuid(uuid);
                    if (course != null){
                        FancyTreeNode node = new FancyTreeNode();
                        node.setKey(uuid);
                        node.setTitle("[" + course.getCourseNo() + "] " +course.getCourseName());
                        if (lastNode != null) {
                            node.setChildren(new ArrayList<FancyTreeNode>());
                            node.getChildren().add(lastNode);
                            node.setExpanded(true);
                        }
                        nodesMap.put(uuid, node);
                        uuid = course.getCourseTypeUuid();
                        lastNode = node;
                    }
                }
            }
            
            if (lastNode != null) {
                topLevelNodeUuids.add(lastNode.getKey());
            }
            lastNode = null;
        } 
        
        List<FancyTreeNode> nodes = new ArrayList<FancyTreeNode>();
        for (String uuid : topLevelNodeUuids) {
            nodes.add(nodesMap.get(uuid));
        }
        
        return nodes;
    }
}
