import { TypeOrmModuleOptions } from "@nestjs/typeorm";

export const typeOrmConfig: TypeOrmModuleOptions = {
      type: 'mysql',
      host: '127.0.0.1',
      port: 3306,
      username: 'livand',
      password: 'livand123',
      database: 'livand',
      entities: [__dirname + '/**/*.entity.{js,ts}'],
      synchronize: true, // 배포시 false해주기!
      connectorPackage: "mysql2",
      logging: true,
}