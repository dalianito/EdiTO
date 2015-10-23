package com.ito.edito.ejb.Material;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.Material;
import com.ito.edito.schema.MaterialAllocate;
import com.ito.edito.schema.MaterialExport;
import com.ito.edito.schema.MaterialImport;
import com.ito.edito.schema.MaterialScrap;
import com.ito.edito.schema.MaterialStorage;
import com.ito.edito.schema.MaterialType;
import com.ito.edito.schema.OfficeApplication;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.schema.OrderGenerate;
import com.ito.edito.schema.Supplier;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Material_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * MaterialType<br>
 * Supplier<br>
 * MaterialInfo<br>
 * Material<br>
 * OfficeApplication<br>
 * OfficeApplicationInfo<br>
 * OrderGenerate<br>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

public interface MaterialService {
	/**
	 * <b>创建物资类别</b>
	 * 
	 * @param materialType MaterialType对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialType的uuid
	 */
	public String insertMaterialType(MaterialType materialType, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新物资类别</b>
	 * 
	 * @param materialType MaterialType对象
	 * @param userName 执行者的账户名
	 */
	public void updateMaterialType(MaterialType materialType, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询物资类别(uuid)</b>
	 * 
	 * @param uuid MaterialType的uuid
	 * @return 查询到的MaterialType
	 */
	public MaterialType selectMaterialTypeByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询物资类别</b>
	 * 
	 * @param constraint MaterialType的约束条件
	 * @return 查询到的MaterialType
	 */
	public MaterialType selectMaterialType(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询物资类别(list)</b>
	 * 
	 * @param constraint MaterialType的约束条件
	 * @return 查询到的MaterialType的list
	 */
	public List<MaterialType> selectMaterialTypes(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>创建供应方</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行创建：<br>
	 * material<br>
	 * 
	 * @param supplier Supplier对象
	 * @param userName 执行者的账户名
	 * @return 创建的Supplier的uuid
	 */
	public String insertSupplier(Supplier supplier, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>更新供应方</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * material<br>
	 * 
	 * @param supplier Supplier对象
	 * @param userName 执行者的账户名
	 */
	public void updateSupplier(Supplier supplier, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询供应方(uuid)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入Supplier中：<br>
	 * material<br>
	 * 
	 * @param uuid Supplier的uuid
	 * @return 查询到的Supplier
	 */
	public Supplier selectSupplierByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询供应方</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入Supplier中：<br>
	 * material<br>
	 * 
	 * @param constraint Supplier的约束条件
	 * @return 查询到的Supplier
	 */
	public Supplier selectSupplier(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询供应方(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入Supplier(list)中：<br>
	 * material<br>
	 * 
	 * @param constraint Supplier的约束条件
	 * @return 查询到的Supplier的list
	 */
	public List<Supplier> selectSuppliers(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建物资</b>
	 * 
	 * @param material Material对象
	 * @param userName 执行者的账户名
	 * @return 创建的Material的uuid
	 */
	public String insertMaterial(Material material, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新物资</b>
	 * 
	 * @param material Material对象
	 * @param userName 执行者的账户名
	 */
	public void updateMaterial(Material material, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询物资(uuid)</b>
	 * 
	 * @param uuid Material的uuid
	 * @return 查询到的Material
	 */
	public Material selectMaterialByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询物资</b>
	 * 
	 * @param constraint Material的约束条件
	 * @return 查询到的Material
	 */
	public Material selectMaterial(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询物资(list)</b>
	 * 
	 * @param constraint Material的约束条件
	 * @return 查询到的Material的list
	 */
	public List<Material> selectMaterials(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>创建物资购买申请</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行创建：<br>
	 * officeApplicationInfo<br>
	 * 
	 * @param officeApplication OfficeApplication对象
	 * @param userName 执行者的账户名
	 * @return 创建的OfficeApplication的uuid
	 */
	public String insertOfficeApplication(OfficeApplication officeApplication, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>更新物资购买申请</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行更新：<br>
	 * (关联表的更新包括创建、更新、删除等操作)<br>
	 * officeApplicationInfo<br>
	 * 
	 * @param officeApplication OfficeApplication对象
	 * @param userName 执行者的账户名
	 */
	public void updateOfficeApplication(OfficeApplication officeApplication, String userName) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询物资购买申请(uuid)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入OfficeApplication中：<br>
	 * officeApplicationInfo<br>
	 * 
	 * @param uuid OfficeApplication的uuid
	 * @return 查询到的OfficeApplication
	 */
	public OfficeApplication selectOfficeApplicationByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>>查询物资购买申请</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入OfficeApplication中：<br>
	 * officeApplicationInfo<br>
	 * 
	 * @param constraint OfficeApplication的约束条件
	 * @return 查询到的OfficeApplication
	 */
	public OfficeApplication selectOfficeApplication(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <p>
	 * <b>查询物资购买申请(list)</b>
	 * </p>
	 * 方法中还包含对下列字段关联表进行查询，并放入OfficeApplication(list)中：<br>
	 * officeApplicationInfo<br>
	 * 
	 * @param constraint OfficeApplication的约束条件
	 * @return 查询到的OfficeApplication的list
	 */
	public List<OfficeApplication> selectOfficeApplications(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>更新物资购买申请信息</b>
	 * 
	 * @param officeApplicationInfo OfficeApplicationInfo对象
	 * @param userName 执行者的账户名
	 */
	public void updateOfficeApplicationInfo(OfficeApplicationInfo officeApplicationInfo, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询物资购买申请信息(uuid)</b>
	 * 
	 * @param uuid OfficeApplicationInfo的uuid
	 * @return 查询到的OfficeApplicationInfo
	 */
	public OfficeApplicationInfo selectOfficeApplicationInfoByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询物资购买申请信息</b>
	 * 
	 * @param constraint OfficeApplicationInfo的约束条件
	 * @return 查询到的OfficeApplicationInfo
	 */
	public OfficeApplicationInfo selectOfficeApplicationInfo(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询物资购买申请信息(list)</b>
	 * 
	 * @param constraint OfficeApplicationInfo的约束条件
	 * @return 查询到的OfficeApplicationInfo的list
	 */
	public List<OfficeApplicationInfo> selectOfficeApplicationInfos(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建采购单</b>
	 * 
	 * @param orderGenerate OrderGenerate对象
	 * @param userName 执行者的账户名
	 * @return 创建的OrderGenerate的uuid
	 */
	public String insertOrderGenerate(OrderGenerate orderGenerate, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新采购单</b>
	 * 
	 * @param orderGenerate OrderGenerate对象
	 * @param userName 执行者的账户名
	 */
	public void updateOrderGenerate(OrderGenerate orderGenerate, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除采购单</b>
	 * 
	 * @param orderGenerate OrderGenerate对象
	 * @param userName 执行者的账户名
	 */
	public void deleteOrderGenerate(OrderGenerate orderGenerate, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询采购单(uuid)</b>
	 * 
	 * @param uuid OrderGenerate的uuid
	 * @return 查询到的OrderGenerate
	 */
	public OrderGenerate selectOrderGenerateByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询采购单</b>
	 * 
	 * @param constraint OrderGenerate的约束条件
	 * @return 查询到的OrderGenerate
	 */
	public OrderGenerate selectOrderGenerate(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询采购单(list)</b>
	 * 
	 * @param constraint OrderGenerate的约束条件
	 * @return 查询到的OrderGenerate的list
	 */
	public List<OrderGenerate> selectOrderGenerates(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建物资入库</b>
	 * 
	 * @param materialImport MaterialImport对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialImport的uuid
	 */
	public String insertMaterialImport(MaterialImport materialImport, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新物资入库</b>
	 * 
	 * @param materialImport MaterialImport对象
	 * @param userName 执行者的账户名
	 */
	public void updateMaterialImport(MaterialImport materialImport, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除物资入库</b>
	 * 
	 * @param materialImport MaterialImport对象
	 * @param userName 执行者的账户名
	 */
	public void deleteMaterialImport(MaterialImport materialImport, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询物资入库(uuid)</b>
	 * 
	 * @param uuid MaterialImport的uuid
	 * @return 查询到的MaterialImport
	 */
	public MaterialImport selectMaterialImportByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询物资入库</b>
	 * 
	 * @param constraint MaterialImport的约束条件
	 * @return 查询到的MaterialImport
	 */
	public MaterialImport selectMaterialImport(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询物资入库(list)</b>
	 * 
	 * @param constraint MaterialImport的约束条件
	 * @return 查询到的MaterialImport的list
	 */
	public List<MaterialImport> selectMaterialImports(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建库存</b>
	 * 
	 * @param materialStorage MaterialStorage对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialStorage的uuid
	 */
	public String insertMaterialStorage(MaterialStorage materialStorage, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新库存</b>
	 * 
	 * @param materialStorage MaterialStorage对象
	 * @param userName 执行者的账户名
	 */
	public void updateMaterialStorage(MaterialStorage materialStorage, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除库存</b>
	 * 
	 * @param materialStorage MaterialStorage对象
	 * @param userName 执行者的账户名
	 */
	public void deleteMaterialStorage(MaterialStorage materialStorage, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询库存(uuid)</b>
	 * 
	 * @param uuid MaterialStorage的uuid
	 * @return 查询到的MaterialStorage
	 */
	public MaterialStorage selectMaterialStorageByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询库存</b>
	 * 
	 * @param constraint MaterialStorage的约束条件
	 * @return 查询到的MaterialStorage
	 */
	public MaterialStorage selectMaterialStorage(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询库存(list)</b>
	 * 
	 * @param constraint MaterialStorage的约束条件
	 * @return 查询到的MaterialStorage的list
	 */
	public List<MaterialStorage> selectMaterialStorages(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建物资试用</b>
	 * 
	 * @param materialExport MaterialExport对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialExport的uuid
	 */
	public String insertMaterialExport(MaterialExport materialExport, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新物资试用</b>
	 * 
	 * @param materialExport MaterialExport对象
	 * @param userName 执行者的账户名
	 */
	public void updateMaterialExport(MaterialExport materialExport, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除物资试用</b>
	 * 
	 * @param materialExport MaterialExport对象
	 * @param userName 执行者的账户名
	 */
	public void deleteMaterialExport(MaterialExport materialExport, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询物资试用(uuid)</b>
	 * 
	 * @param uuid MaterialExport的uuid
	 * @return 查询到的MaterialExport
	 */
	public MaterialExport selectMaterialExportByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询物资试用</b>
	 * 
	 * @param constraint MaterialExport的约束条件
	 * @return 查询到的MaterialExport
	 */
	public MaterialExport selectMaterialExport(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询物资试用(list)</b>
	 * 
	 * @param constraint MaterialExport的约束条件
	 * @return 查询到的MaterialExport的list
	 */
	public List<MaterialExport> selectMaterialExports(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建物资报废</b>
	 * 
	 * @param materialScrap MaterialScrap对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialScrap的uuid
	 */
	public String insertMaterialScrap(MaterialScrap materialScrap, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新物资报废</b>
	 * 
	 * @param materialScrap MaterialScrap对象
	 * @param userName 执行者的账户名
	 */
	public void updateMaterialScrap(MaterialScrap materialScrap, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除物资报废</b>
	 * 
	 * @param materialScrap MaterialScrap对象
	 * @param userName 执行者的账户名
	 */
	public void deleteMaterialScrap(MaterialScrap materialScrap, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询物资报废(uuid)</b>
	 * 
	 * @param uuid MaterialScrap的uuid
	 * @return 查询到的MaterialScrap
	 */
	public MaterialScrap selectMaterialScrapByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询物资报废</b>
	 * 
	 * @param constraint MaterialScrap的约束条件
	 * @return 查询到的MaterialScrap
	 */
	public MaterialScrap selectMaterialScrap(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询物资报废(list)</b>
	 * 
	 * @param constraint MaterialScrap的约束条件
	 * @return 查询到的MaterialScrap的list
	 */
	public List<MaterialScrap> selectMaterialScraps(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建物资调配</b>
	 * 
	 * @param materialAllocate MaterialAllocate对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialAllocate的uuid
	 */
	public String insertMaterialAllocate(MaterialAllocate materialAllocate, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新物资调配</b>
	 * 
	 * @param materialAllocate MaterialAllocate对象
	 * @param userName 执行者的账户名
	 */
	public void updateMaterialAllocate(MaterialAllocate materialAllocate, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除物资调配</b>
	 * 
	 * @param materialAllocate MaterialAllocate对象
	 * @param userName 执行者的账户名
	 */
	public void deleteMaterialAllocate(MaterialAllocate materialAllocate, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询物资调配(uuid)</b>
	 * 
	 * @param uuid MaterialAllocate的uuid
	 * @return 查询到的MaterialAllocate
	 */
	public MaterialAllocate selectMaterialAllocateByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询物资调配</b>
	 * 
	 * @param constraint MaterialAllocate的约束条件
	 * @return 查询到的MaterialAllocate
	 */
	public MaterialAllocate selectMaterialAllocate(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询物资调配(list)</b>
	 * 
	 * @param constraint MaterialAllocate的约束条件
	 * @return 查询到的MaterialAllocate的list
	 */
	public List<MaterialAllocate> selectMaterialAllocates(Constraint constraint) throws Exception, RemoteException;

}
