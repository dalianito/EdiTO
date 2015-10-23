package com.ito.edito.course;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.Course;
import com.ito.edito.schema.CourseCategoryType;
import com.ito.edito.util.FancyTreeNode;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

/*
 * Return course categories as well as related courses as a JSON tree.
 */
public class QueryCourseDataAjaxAction extends AjaxAction {
    private ClassService classService;

    public void executeManualUT() throws Exception {
        String nodeUuid = request.getParameter("nodeUuid");
        classService = (ClassService) JndiFactory.lookup("classService");
      
        List<FancyTreeNode> nodes = getChildren(nodeUuid);
        setResponseText(nodes);
    }
    
    private List<FancyTreeNode> getChildren(String uuid) throws Exception {
        List<FancyTreeNode> nodes = new ArrayList<FancyTreeNode>();
        for (CourseCategoryType type : getChildCourseCategoryTypes(uuid)) {
            FancyTreeNode node = new FancyTreeNode();
            node.setKey(type.getUuid());
            node.setTitle(type.getDescription());
            node.setLazy(hasChild(type.getUuid()));
            nodes.add(node);
        }
        
        for (Course course : getCoursesByCourseTypeUuid(uuid)) {
            FancyTreeNode node = new FancyTreeNode();
            node.setKey(course.getUuid());
            node.setTitle("[" + course.getCourseNo() + "] " + course.getCourseName());
            node.setLazy(false);
            nodes.add(node);
        }
        
        return nodes;
    }
    
    // Return true if current node has child courses or courseCategoryTypes
    // otherwise return false
    private boolean hasChild(String uuid) throws RemoteException, Exception {
        if (getChildCourseCategoryTypes(uuid).size() > 0) {
            return true;
        }
        
        return getCoursesByCourseTypeUuid(uuid).size() > 0;
    }
    
    private List<Course> getCoursesByCourseTypeUuid(String courseTypeUuid) throws RemoteException, Exception {
        Constraint constraint = new Constraint("Course");
        constraint.addCondition("courseTypeUuid", courseTypeUuid);
        constraint.addCondition("ifUsing", "1");
        return classService.selectCourses(constraint);
    }

    private List<CourseCategoryType> getChildCourseCategoryTypes(String uuid) throws RemoteException, Exception {
        Constraint constraint = new Constraint("CourseCategoryType");
        constraint.addCondition("parentUuid", uuid);
        constraint.addCondition("ifUsing", "1");
        return classService.selectCourseCategoryTypes(constraint);
    }

}
