package com.yidu.util;
import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig; 
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

/**
 * <p>
 * 测试生成代码
 * </p>
 *<p>
 * 使用该代码自动生成之后,不再需要使用generatorConfig.xml
 *</p>
 * @author K神
 * 
 * @date 2017/12/18
 */
public class GeneratorServiceEntity {

	
	public static void main(String[] args) {
		new GeneratorServiceEntity().generateCode();
	}
	
    public void generateCode() {
        String packageName = "com.yidu";
        boolean serviceNameStartWithI = false;//user -> UserService, 设置成true: user -> IUserService
        //generateByTables(serviceNameStartWithI, packageName, 
        //		"WIN_TYPE", "WIN_BALLTYPE","WIN_DIC","WIN_MEMBER","WIN_MEMBER_ORDER",
        //		"WIN_MEMBER_ORDER_INFO","WIN_MEMBER_RECHARGE","WIN_STAGE");
        
        generateByTables(serviceNameStartWithI, packageName, 
        		"tb_area","tb_locker","tb_cabinet","tb_charge","tb_user","tb_record");
    }

    private void generateByTables(boolean serviceNameStartWithI, String packageName, String... tableNames) {
        GlobalConfig config = new GlobalConfig();
        String dbUrl = "jdbc:mysql://127.0.0.1:3306/chuwuguei?useUnicode=true&characterEncoding=UTF-8";
        DataSourceConfig dataSourceConfig = new DataSourceConfig();
        dataSourceConfig.setDbType(DbType.MYSQL)
                .setUrl(dbUrl)
                .setUsername("root")
                .setPassword("123")
                .setDriverName("com.mysql.jdbc.Driver");
        StrategyConfig strategyConfig = new StrategyConfig();
        strategyConfig
                .setCapitalMode(true)
                .setEntityLombokModel(false)  
                .setTablePrefix("tb_")
                .setColumnNaming(NamingStrategy.underline_to_camel) 
                .setNaming(NamingStrategy.underline_to_camel)
                .setInclude(tableNames);//修改替换成你需要的表名，多个表名传数组
        config.setActiveRecord(false)
        		.setEnableCache(false)
        		.setBaseColumnList(true)
        		.setBaseResultMap(true)
                .setAuthor("liandyao")
                .setOutputDir("D:\\mybatis生成\\mybatis2\\spring")
                .setFileOverride(true);
        if (!serviceNameStartWithI) {
            config.setServiceName("%sService");
        }
        new AutoGenerator().setGlobalConfig(config)
                .setDataSource(dataSourceConfig)
                .setStrategy(strategyConfig)
                .setPackageInfo(
                        new PackageConfig()
                                .setParent(packageName)
                                .setController("Action")
                                .setEntity("entity")
                ).execute();
    }

    private void generateByTables(String packageName, String... tableNames) {
        generateByTables(true, packageName, tableNames);
    }
}