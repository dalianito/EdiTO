package com.ito.edito.ejb.Material;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.Material;
import com.ito.edito.schema.MaterialAllocate;
import com.ito.edito.schema.MaterialExport;
import com.ito.edito.schema.MaterialImport;
import com.ito.edito.schema.MaterialInfo;
import com.ito.edito.schema.MaterialScrap;
import com.ito.edito.schema.MaterialStorage;
import com.ito.edito.schema.MaterialType;
import com.ito.edito.schema.OfficeApplication;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.schema.OrderGenerate;
import com.ito.edito.schema.Supplier;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Material_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * MaterialType<br>
 * Supplier<br>
 * MaterialInfo<br>
 * Material<br>
 * OfficeApplication<br>
 * OfficeApplicationInfo<br>
 * OrderGenerate<br>
 * MaterialImport<br>
 * MaterialExport<br>
 * MaterialScrap<br>
 * MaterialAllocate<br>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class MaterialServiceBean extends CastorDataManager implements MaterialServiceRemote {
	/**
	 * <b>创建物资类别</b>
	 * 
	 * @param materialType MaterialType对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialType的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertMaterialType(MaterialType materialType, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(materialType, userName);
	}

	/**
	 * <b>更新物资类别</b>
	 * 
	 * @param materialType MaterialType对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateMaterialType(MaterialType materialType, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(materialType, userName);
	}

	/**
	 * <b>查询物资类别(uuid)</b>
	 * 
	 * @param uuid MaterialType的uuid
	 * @return 查询到的MaterialType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialType selectMaterialTypeByUuid(String uuid) throws Exception, RemoteException {
		return (MaterialType) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询物资类别</b>
	 * 
	 * @param constraint MaterialType的约束条件
	 * @return 查询到的MaterialType
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialType selectMaterialType(Constraint constraint) throws Exception, RemoteException {
		return (MaterialType) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询物资类别(list)</b>
	 * 
	 * @param constraint MaterialType的约束条件
	 * @return 查询到的MaterialType的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<MaterialType> selectMaterialTypes(Constraint constraint) throws Exception, RemoteException {
		return (List<MaterialType>) DataManagerStatic.getInstances(constraint);
	}

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertSupplier(Supplier supplier, String userName) throws Exception, RemoteException {
		// 创建供应方
		String supplierUuid = DataManagerStatic.createInstance(supplier, userName);

		// 创建供方供应物资
		List<MaterialInfo> materialsAsReference = supplier.getMaterialsAsReference();
		for (int i = 0; i < materialsAsReference.size(); i++) {
			MaterialInfo materialInfo = materialsAsReference.get(i);
			materialInfo.setBizDataUuid(supplierUuid, false);
			DataManagerStatic.createInstance(materialInfo, userName);
		}

		return supplierUuid;
	}

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateSupplier(Supplier supplier, String userName) throws Exception, RemoteException {
		// 更新供方供应物资
		List<MaterialInfo> materialsAsReference = supplier.getMaterialsAsReference();
		for (int i = 0; i < materialsAsReference.size(); i++) {
			MaterialInfo materialInfo = materialsAsReference.get(i);
			if (materialInfo.getOperationStatus().equals("0")) {
				materialInfo.setBizDataUuid(supplier.getUuid(), false);
				DataManagerStatic.createInstance(materialInfo, userName);
			}
			else if (materialInfo.getOperationStatus().equals("1")) {
				materialInfo.setBizDataUuid(supplier.getUuid(), false);
				DataManagerStatic.updateInstance(materialInfo, userName);
			}
			else if (materialInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(materialInfo, userName);
			}
		}

		// 更新供应方
		DataManagerStatic.updateInstance(supplier, userName);
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Supplier selectSupplierByUuid(String uuid) throws Exception, RemoteException {
		// 查询供应方(uuid)
		Supplier supplier = (Supplier) DataManagerStatic.getInstance(uuid);

		// 查询供方供应物资
		Constraint materialInfoC = new Constraint("MaterialInfo");
		materialInfoC.addCondition("bizDataUuid", uuid);
		supplier.setMaterials((List<MaterialInfo>) DataManagerStatic.getInstances(materialInfoC));

		return supplier;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Supplier selectSupplier(Constraint constraint) throws Exception, RemoteException {
		// 查询供应方(uuid)
		Supplier supplier = (Supplier) DataManagerStatic.getInstance(constraint);

		// 查询供方供应物资
		Constraint materialInfoC = new Constraint("MaterialInfo");
		materialInfoC.addCondition("bizDataUuid", supplier.getUuid());
		supplier.setMaterials((List<MaterialInfo>) DataManagerStatic.getInstances(materialInfoC));

		return supplier;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Supplier> selectSuppliers(Constraint constraint) throws Exception, RemoteException {
		// 查询供应方(list)
		List<Supplier> suppliersTemp = (List<Supplier>) DataManagerStatic.getInstances(constraint);
		List<Supplier> suppliers = new ArrayList();
		for (int i = 0; i < suppliersTemp.size(); i++) {
			Supplier supplier = suppliersTemp.get(i);

			// 查询供方供应物资
			Constraint materialInfoC = new Constraint("MaterialInfo");
			materialInfoC.addCondition("bizDataUuid", supplier.getUuid());
			supplier.setMaterials((List<MaterialInfo>) DataManagerStatic.getInstances(materialInfoC));

			suppliers.add(supplier);
		}

		return suppliers;
	}

	/**
	 * <b>创建物资</b>
	 * 
	 * @param material Material对象
	 * @param userName 执行者的账户名
	 * @return 创建的Material的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertMaterial(Material material, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(material, userName);
	}

	/**
	 * <b>更新物资</b>
	 * 
	 * @param material Material对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateMaterial(Material material, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(material, userName);
	}

	/**
	 * <b>查询物资(uuid)</b>
	 * 
	 * @param uuid Material的uuid
	 * @return 查询到的Material
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Material selectMaterialByUuid(String uuid) throws Exception, RemoteException {
		return (Material) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询物资</b>
	 * 
	 * @param constraint Material的约束条件
	 * @return 查询到的Material
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Material selectMaterial(Constraint constraint) throws Exception, RemoteException {
		return (Material) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询物资(list)</b>
	 * 
	 * @param constraint Material的约束条件
	 * @return 查询到的Material的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Material> selectMaterials(Constraint constraint) throws Exception, RemoteException {
		return (List<Material>) DataManagerStatic.getInstances(constraint);
	}

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertOfficeApplication(OfficeApplication officeApplication, String userName) throws Exception, RemoteException {
		// 创建物资购买申请
		String officeApplicationUuid = DataManagerStatic.createInstance(officeApplication, userName);

		// 物资购买申请信息
		List<OfficeApplicationInfo> officeApplicationInfoList = officeApplication.getOfficeMaterialsAsReference();
		for (int i = 0; i < officeApplicationInfoList.size(); i++) {
			OfficeApplicationInfo officeApplicationInfo = officeApplicationInfoList.get(i);
			officeApplicationInfo.setBizDataUuid(officeApplicationUuid, false);
			DataManagerStatic.createInstance(officeApplicationInfo, userName);
		}
		return officeApplicationUuid;
	}

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
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateOfficeApplication(OfficeApplication officeApplication, String userName) throws Exception, RemoteException {
		// 物资购买申请信息

		List<OfficeApplicationInfo> officeApplicationInfoList = officeApplication.getOfficeMaterialsAsReference();
		for (int i = 0; i < officeApplicationInfoList.size(); i++) {
			OfficeApplicationInfo officeApplicationInfo = officeApplicationInfoList.get(i);
			if (officeApplicationInfo.getOperationStatus().equals("0")) {
				officeApplicationInfo.setBizDataUuid(officeApplication.getUuid(), false);
				DataManagerStatic.createInstance(officeApplicationInfo, userName);
			}
			else if (officeApplicationInfo.getOperationStatus().equals("1")) {
				officeApplicationInfo.setBizDataUuid(officeApplication.getUuid(), false);
				DataManagerStatic.updateInstance(officeApplicationInfo, userName);
			}
			else if (officeApplicationInfo.getOperationStatus().equals("2")) {
				DataManagerStatic.removeInstance(officeApplicationInfo, userName);
			}
		}

		// 物资购买申请信息
		DataManagerStatic.updateInstance(officeApplication, userName);
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public OfficeApplication selectOfficeApplicationByUuid(String uuid) throws Exception, RemoteException {
		// 查询物资购买申请(uuid)
		OfficeApplication officeApplication = (OfficeApplication) DataManagerStatic.getInstance(uuid);

		// 查询物资购买申请信息
		Constraint officeApplicationInfo = new Constraint("OfficeApplicationInfo");
		officeApplicationInfo.addCondition("bizDataUuid", officeApplication.getUuid());
		officeApplication.setOfficeMaterials((List<OfficeApplicationInfo>) DataManagerStatic.getInstances(officeApplicationInfo));
		return officeApplication;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public OfficeApplication selectOfficeApplication(Constraint constraint) throws Exception, RemoteException {
		// 查询应聘
		OfficeApplication officeApplication = (OfficeApplication) DataManagerStatic.getInstance(constraint);

		if (officeApplication != null) {
			// 查询工作经历
			Constraint officeApplicationInfo = new Constraint("OfficeApplicationInfo");
			officeApplicationInfo.addCondition("bizDataUuid", officeApplication.getUuid());
			officeApplication.setOfficeMaterials((List<OfficeApplicationInfo>) DataManagerStatic.getInstances(officeApplicationInfo));
		}
		return officeApplication;
	}

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
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<OfficeApplication> selectOfficeApplications(Constraint constraint) throws Exception, RemoteException {
		// 查询物资购买申请(list)
		List<OfficeApplication> officeApplicationTemp = (List<OfficeApplication>) DataManagerStatic.getInstances(constraint);
		List<OfficeApplication> officeApplications = new ArrayList();
		for (int i = 0; i < officeApplicationTemp.size(); i++) {
			OfficeApplication officeApplication = officeApplicationTemp.get(i);

			// 查询物资购买申请信息
			Constraint officeApplicationInfo = new Constraint("OfficeApplicationInfo");
			officeApplicationInfo.addCondition("bizDataUuid", officeApplication.getUuid());
			officeApplication.setOfficeMaterials((List<OfficeApplicationInfo>) DataManagerStatic.getInstances(officeApplicationInfo));

			officeApplications.add(officeApplication);
		}

		return officeApplications;
	}

	/**
	 * <b>更新物资购买申请信息</b>
	 * 
	 * @param officeApplicationInfo OfficeApplicationInfo对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateOfficeApplicationInfo(OfficeApplicationInfo officeApplicationInfo, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(officeApplicationInfo, userName);
	}

	/**
	 * <b>查询物资购买申请信息(uuid)</b>
	 * 
	 * @param uuid OfficeApplicationInfo的uuid
	 * @return 查询到的OfficeApplicationInfo
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public OfficeApplicationInfo selectOfficeApplicationInfoByUuid(String uuid) throws Exception, RemoteException {
		return (OfficeApplicationInfo) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询物资购买申请信息</b>
	 * 
	 * @param constraint OfficeApplicationInfo的约束条件
	 * @return 查询到的OfficeApplicationInfo
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public OfficeApplicationInfo selectOfficeApplicationInfo(Constraint constraint) throws Exception, RemoteException {
		return (OfficeApplicationInfo) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询物资购买申请信息(list)</b>
	 * 
	 * @param constraint OfficeApplicationInfo的约束条件
	 * @return 查询到的OfficeApplicationInfo的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<OfficeApplicationInfo> selectOfficeApplicationInfos(Constraint constraint) throws Exception, RemoteException {
		return (List<OfficeApplicationInfo>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建采购单</b>
	 * 
	 * @param orderGenerate OrderGenerate对象
	 * @param userName 执行者的账户名
	 * @return 创建的OrderGenerate的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertOrderGenerate(OrderGenerate orderGenerate, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(orderGenerate, userName);
	}

	/**
	 * <b>更新采购单</b>
	 * 
	 * @param orderGenerate OrderGenerate对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateOrderGenerate(OrderGenerate orderGenerate, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(orderGenerate, userName);
	}

	/**
	 * <b>删除采购单</b>
	 * 
	 * @param orderGenerate OrderGenerate对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteOrderGenerate(OrderGenerate orderGenerate, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(orderGenerate, userName);
	}

	/**
	 * <b>查询采购单(uuid)</b>
	 * 
	 * @param uuid OrderGenerate的uuid
	 * @return 查询到的OrderGenerate
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public OrderGenerate selectOrderGenerateByUuid(String uuid) throws Exception, RemoteException {
		return (OrderGenerate) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询采购单</b>
	 * 
	 * @param constraint OrderGenerate的约束条件
	 * @return 查询到的OrderGenerate
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public OrderGenerate selectOrderGenerate(Constraint constraint) throws Exception, RemoteException {
		return (OrderGenerate) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询采购单(list)</b>
	 * 
	 * @param constraint OrderGenerate的约束条件
	 * @return 查询到的OrderGenerate的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<OrderGenerate> selectOrderGenerates(Constraint constraint) throws Exception, RemoteException {
		return (List<OrderGenerate>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建物资入库</b>
	 * 
	 * @param materialImport MaterialImport对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialImport的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertMaterialImport(MaterialImport materialImport, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(materialImport, userName);
	}

	/**
	 * <b>更新物资入库</b>
	 * 
	 * @param materialImport MaterialImport对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateMaterialImport(MaterialImport materialImport, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(materialImport, userName);
	}

	/**
	 * <b>删除物资入库</b>
	 * 
	 * @param materialImport MaterialImport对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteMaterialImport(MaterialImport materialImport, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(materialImport, userName);
	}

	/**
	 * <b>查询物资入库(uuid)</b>
	 * 
	 * @param uuid MaterialImport的uuid
	 * @return 查询到的MaterialImport
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialImport selectMaterialImportByUuid(String uuid) throws Exception, RemoteException {
		return (MaterialImport) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询物资入库</b>
	 * 
	 * @param constraint MaterialImport的约束条件
	 * @return 查询到的MaterialImport
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialImport selectMaterialImport(Constraint constraint) throws Exception, RemoteException {
		return (MaterialImport) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询物资入库(list)</b>
	 * 
	 * @param constraint MaterialImport的约束条件
	 * @return 查询到的MaterialImport的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<MaterialImport> selectMaterialImports(Constraint constraint) throws Exception, RemoteException {
		return (List<MaterialImport>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建库存</b>
	 * 
	 * @param materialStorage MaterialStorage对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialStorage的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertMaterialStorage(MaterialStorage materialStorage, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(materialStorage, userName);
	}

	/**
	 * <b>更新库存</b>
	 * 
	 * @param materialStorage MaterialStorage对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateMaterialStorage(MaterialStorage materialStorage, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(materialStorage, userName);
	}

	/**
	 * <b>删除库存</b>
	 * 
	 * @param materialStorage MaterialStorage对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteMaterialStorage(MaterialStorage materialStorage, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(materialStorage, userName);
	}

	/**
	 * <b>查询库存(uuid)</b>
	 * 
	 * @param uuid MaterialStorage的uuid
	 * @return 查询到的MaterialStorage
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialStorage selectMaterialStorageByUuid(String uuid) throws Exception, RemoteException {
		return (MaterialStorage) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询库存</b>
	 * 
	 * @param constraint MaterialStorage的约束条件
	 * @return 查询到的MaterialStorage
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialStorage selectMaterialStorage(Constraint constraint) throws Exception, RemoteException {
		return (MaterialStorage) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询库存(list)</b>
	 * 
	 * @param constraint MaterialStorage的约束条件
	 * @return 查询到的MaterialStorage的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<MaterialStorage> selectMaterialStorages(Constraint constraint) throws Exception, RemoteException {
		return (List<MaterialStorage>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建物资试用</b>
	 * 
	 * @param materialExport MaterialExport对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialExport的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertMaterialExport(MaterialExport materialExport, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(materialExport, userName);
	}

	/**
	 * <b>更新物资试用</b>
	 * 
	 * @param materialExport MaterialExport对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateMaterialExport(MaterialExport materialExport, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(materialExport, userName);
	}

	/**
	 * <b>删除物资试用</b>
	 * 
	 * @param materialExport MaterialExport对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteMaterialExport(MaterialExport materialExport, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(materialExport, userName);
	}

	/**
	 * <b>查询物资试用(uuid)</b>
	 * 
	 * @param uuid MaterialExport的uuid
	 * @return 查询到的MaterialExport
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialExport selectMaterialExportByUuid(String uuid) throws Exception, RemoteException {
		return (MaterialExport) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询物资试用</b>
	 * 
	 * @param constraint MaterialExport的约束条件
	 * @return 查询到的MaterialExport
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialExport selectMaterialExport(Constraint constraint) throws Exception, RemoteException {
		return (MaterialExport) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询物资试用(list)</b>
	 * 
	 * @param constraint MaterialExport的约束条件
	 * @return 查询到的MaterialExport的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<MaterialExport> selectMaterialExports(Constraint constraint) throws Exception, RemoteException {
		return (List<MaterialExport>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建物资报废</b>
	 * 
	 * @param materialScrap MaterialScrap对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialScrap的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertMaterialScrap(MaterialScrap materialScrap, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(materialScrap, userName);
	}

	/**
	 * <b>更新物资报废</b>
	 * 
	 * @param materialScrap MaterialScrap对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateMaterialScrap(MaterialScrap materialScrap, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(materialScrap, userName);
	}

	/**
	 * <b>删除物资报废</b>
	 * 
	 * @param materialScrap MaterialScrap对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteMaterialScrap(MaterialScrap materialScrap, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(materialScrap, userName);
	}

	/**
	 * <b>查询物资报废(uuid)</b>
	 * 
	 * @param uuid MaterialScrap的uuid
	 * @return 查询到的MaterialScrap
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialScrap selectMaterialScrapByUuid(String uuid) throws Exception, RemoteException {
		return (MaterialScrap) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询物资报废</b>
	 * 
	 * @param constraint MaterialScrap的约束条件
	 * @return 查询到的MaterialScrap
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialScrap selectMaterialScrap(Constraint constraint) throws Exception, RemoteException {
		return (MaterialScrap) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询物资报废(list)</b>
	 * 
	 * @param constraint MaterialScrap的约束条件
	 * @return 查询到的MaterialScrap的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<MaterialScrap> selectMaterialScraps(Constraint constraint) throws Exception, RemoteException {
		return (List<MaterialScrap>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建物资调配</b>
	 * 
	 * @param materialAllocate MaterialAllocate对象
	 * @param userName 执行者的账户名
	 * @return 创建的MaterialAllocate的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertMaterialAllocate(MaterialAllocate materialAllocate, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(materialAllocate, userName);
	}

	/**
	 * <b>更新物资调配</b>
	 * 
	 * @param materialAllocate MaterialAllocate对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateMaterialAllocate(MaterialAllocate materialAllocate, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(materialAllocate, userName);
	}

	/**
	 * <b>删除物资调配</b>
	 * 
	 * @param materialAllocate MaterialAllocate对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteMaterialAllocate(MaterialAllocate materialAllocate, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(materialAllocate, userName);
	}

	/**
	 * <b>查询物资调配(uuid)</b>
	 * 
	 * @param uuid MaterialAllocate的uuid
	 * @return 查询到的MaterialAllocate
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialAllocate selectMaterialAllocateByUuid(String uuid) throws Exception, RemoteException {
		return (MaterialAllocate) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询物资调配</b>
	 * 
	 * @param constraint MaterialAllocate的约束条件
	 * @return 查询到的MaterialAllocate
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public MaterialAllocate selectMaterialAllocate(Constraint constraint) throws Exception, RemoteException {
		return (MaterialAllocate) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询物资调配(list)</b>
	 * 
	 * @param constraint MaterialAllocate的约束条件
	 * @return 查询到的MaterialAllocate的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<MaterialAllocate> selectMaterialAllocates(Constraint constraint) throws Exception, RemoteException {
		return (List<MaterialAllocate>) DataManagerStatic.getInstances(constraint);
	}

}
