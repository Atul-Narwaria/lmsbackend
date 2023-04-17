
Object.defineProperty(exports, "__esModule", { value: true });

const {
  Decimal,
  objectEnumValues,
  makeStrictEnum
} = require('./runtime/index-browser')


const Prisma = {}

exports.Prisma = Prisma

/**
 * Prisma Client JS version: 4.9.0
 * Query Engine version: ceb5c99003b99c9ee2c1d2e618e359c14aef2ea5
 */
Prisma.prismaVersion = {
  client: "4.9.0",
  engine: "ceb5c99003b99c9ee2c1d2e618e359c14aef2ea5"
}

Prisma.PrismaClientKnownRequestError = () => {
  throw new Error(`PrismaClientKnownRequestError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)};
Prisma.PrismaClientUnknownRequestError = () => {
  throw new Error(`PrismaClientUnknownRequestError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.PrismaClientRustPanicError = () => {
  throw new Error(`PrismaClientRustPanicError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.PrismaClientInitializationError = () => {
  throw new Error(`PrismaClientInitializationError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.PrismaClientValidationError = () => {
  throw new Error(`PrismaClientValidationError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.NotFoundError = () => {
  throw new Error(`NotFoundError is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.Decimal = Decimal

/**
 * Re-export of sql-template-tag
 */
Prisma.sql = () => {
  throw new Error(`sqltag is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.empty = () => {
  throw new Error(`empty is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.join = () => {
  throw new Error(`join is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.raw = () => {
  throw new Error(`raw is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.validator = () => (val) => val


/**
 * Shorthand utilities for JSON filtering
 */
Prisma.DbNull = objectEnumValues.instances.DbNull
Prisma.JsonNull = objectEnumValues.instances.JsonNull
Prisma.AnyNull = objectEnumValues.instances.AnyNull

Prisma.NullTypes = {
  DbNull: objectEnumValues.classes.DbNull,
  JsonNull: objectEnumValues.classes.JsonNull,
  AnyNull: objectEnumValues.classes.AnyNull
}

/**
 * Enums
 */
// Based on
// https://github.com/microsoft/TypeScript/issues/3192#issuecomment-261720275
function makeEnum(x) { return x; }

exports.Prisma.AdminScalarFieldEnum = makeEnum({
  id: 'id',
  email: 'email',
  password: 'password',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.CityScalarFieldEnum = makeEnum({
  id: 'id',
  CityName: 'CityName',
  fkStateId: 'fkStateId',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.ClassmasterScalarFieldEnum = makeEnum({
  id: 'id',
  name: 'name',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.CountryScalarFieldEnum = makeEnum({
  id: 'id',
  CounrtyName: 'CounrtyName',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.DesignationScalarFieldEnum = makeEnum({
  id: 'id',
  roles: 'roles',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.QueryMode = makeEnum({
  default: 'default',
  insensitive: 'insensitive'
});

exports.Prisma.SalesTeamAddressScalarFieldEnum = makeEnum({
  id: 'id',
  fkSalesTeamId: 'fkSalesTeamId',
  fkCountryId: 'fkCountryId',
  fkStateId: 'fkStateId',
  fkCityId: 'fkCityId',
  Address: 'Address',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.SalesTeamDocumentsScalarFieldEnum = makeEnum({
  id: 'id',
  fkSalesTeamId: 'fkSalesTeamId',
  category: 'category',
  comment: 'comment',
  url: 'url',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.SalesTeamScalarFieldEnum = makeEnum({
  id: 'id',
  email: 'email',
  phone: 'phone',
  password: 'password',
  dob: 'dob',
  fkDesignationId: 'fkDesignationId',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.SchoolBoardScalarFieldEnum = makeEnum({
  id: 'id',
  boardname: 'boardname',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.SchoolMasterAddressScalarFieldEnum = makeEnum({
  id: 'id',
  fkSchoolId: 'fkSchoolId',
  fkCountryId: 'fkCountryId',
  fkStateId: 'fkStateId',
  fkCityId: 'fkCityId',
  Address: 'Address',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.SchoolMasterScalarFieldEnum = makeEnum({
  id: 'id',
  name: 'name',
  afflicationCode: 'afflicationCode',
  fkSchoolType: 'fkSchoolType',
  fkSchoolBoard: 'fkSchoolBoard',
  fkSalesTeamId: 'fkSalesTeamId',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.SchoolTypeScalarFieldEnum = makeEnum({
  id: 'id',
  schoolType: 'schoolType',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.SortOrder = makeEnum({
  asc: 'asc',
  desc: 'desc'
});

exports.Prisma.StateScalarFieldEnum = makeEnum({
  id: 'id',
  StateName: 'StateName',
  fkCountryId: 'fkCountryId',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.StudentAddressScalarFieldEnum = makeEnum({
  id: 'id',
  fkStudentId: 'fkStudentId',
  fkCountryId: 'fkCountryId',
  fkStateId: 'fkStateId',
  fkCityId: 'fkCityId',
  Address: 'Address',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.StudentDocumentsScalarFieldEnum = makeEnum({
  id: 'id',
  fkStudentId: 'fkStudentId',
  category: 'category',
  docUrl: 'docUrl',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.StudentMasterScalarFieldEnum = makeEnum({
  id: 'id',
  firstName: 'firstName',
  lastName: 'lastName',
  email: 'email',
  phone: 'phone',
  password: 'password',
  dob: 'dob',
  admissionId: 'admissionId',
  rollNo: 'rollNo',
  profileImg: 'profileImg',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.StudentParentsScalarFieldEnum = makeEnum({
  id: 'id',
  fkStudentId: 'fkStudentId',
  name: 'name',
  relation: 'relation',
  phone: 'phone',
  email: 'email',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.SubjectmasterScalarFieldEnum = makeEnum({
  id: 'id',
  name: 'name',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.TeacherAddressScalarFieldEnum = makeEnum({
  id: 'id',
  fkTeacherId: 'fkTeacherId',
  fkCountryId: 'fkCountryId',
  fkStateId: 'fkStateId',
  fkCityId: 'fkCityId',
  Address: 'Address',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.TeacherDepartmentScalarFieldEnum = makeEnum({
  id: 'id',
  department: 'department',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.TeacherDocumentsScalarFieldEnum = makeEnum({
  id: 'id',
  fkTeacherId: 'fkTeacherId',
  category: 'category',
  docUrl: 'docUrl',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.TeacherExprienceScalarFieldEnum = makeEnum({
  id: 'id',
  fkTeacherId: 'fkTeacherId',
  skills: 'skills',
  experience: 'experience',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.TeacherMasterScalarFieldEnum = makeEnum({
  id: 'id',
  firstName: 'firstName',
  lastName: 'lastName',
  email: 'email',
  phone: 'phone',
  password: 'password',
  gender: 'gender',
  dob: 'dob',
  teacherId: 'teacherId',
  fkTeacherDepartmentId: 'fkTeacherDepartmentId',
  profileImg: 'profileImg',
  joiningDate: 'joiningDate',
  fkDesignationId: 'fkDesignationId',
  status: 'status',
  createAt: 'createAt',
  updatedAt: 'updatedAt'
});

exports.Prisma.TransactionIsolationLevel = makeStrictEnum({
  ReadUncommitted: 'ReadUncommitted',
  ReadCommitted: 'ReadCommitted',
  RepeatableRead: 'RepeatableRead',
  Serializable: 'Serializable'
});


exports.Prisma.ModelName = makeEnum({
  Designation: 'Designation',
  Country: 'Country',
  State: 'State',
  City: 'City',
  Admin: 'Admin',
  SalesTeam: 'SalesTeam',
  SalesTeamDocuments: 'SalesTeamDocuments',
  SalesTeamAddress: 'SalesTeamAddress',
  SchoolBoard: 'SchoolBoard',
  schoolType: 'schoolType',
  schoolMaster: 'schoolMaster',
  SchoolMasterAddress: 'SchoolMasterAddress',
  Classmaster: 'Classmaster',
  Subjectmaster: 'Subjectmaster',
  StudentMaster: 'StudentMaster',
  StudentParents: 'StudentParents',
  StudentDocuments: 'StudentDocuments',
  StudentAddress: 'StudentAddress',
  TeacherDepartment: 'TeacherDepartment',
  TeacherMaster: 'TeacherMaster',
  TeacherExprience: 'TeacherExprience',
  TeacherDocuments: 'TeacherDocuments',
  TeacherAddress: 'TeacherAddress'
});

/**
 * Create the Client
 */
class PrismaClient {
  constructor() {
    throw new Error(
      `PrismaClient is unable to be run in the browser.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
    )
  }
}
exports.PrismaClient = PrismaClient

Object.assign(exports, Prisma)
