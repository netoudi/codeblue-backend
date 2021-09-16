import { addAttributeOptions } from 'sequelize-typescript';

export function ToNumber(target: any, propertyKey: string) {
  addAttributeOptions(target, propertyKey, {
    get() {
      return +this.getDataValue(propertyKey);
    },
  });
}
