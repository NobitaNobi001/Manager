package com.bean;

import java.util.ArrayList;
import java.util.List;

public class RecordExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public RecordExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andStuNumberIsNull() {
            addCriterion("stu_number is null");
            return (Criteria) this;
        }

        public Criteria andStuNumberIsNotNull() {
            addCriterion("stu_number is not null");
            return (Criteria) this;
        }

        public Criteria andStuNumberEqualTo(Integer value) {
            addCriterion("stu_number =", value, "stuNumber");
            return (Criteria) this;
        }

        public Criteria andStuNumberNotEqualTo(Integer value) {
            addCriterion("stu_number <>", value, "stuNumber");
            return (Criteria) this;
        }

        public Criteria andStuNumberGreaterThan(Integer value) {
            addCriterion("stu_number >", value, "stuNumber");
            return (Criteria) this;
        }

        public Criteria andStuNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("stu_number >=", value, "stuNumber");
            return (Criteria) this;
        }

        public Criteria andStuNumberLessThan(Integer value) {
            addCriterion("stu_number <", value, "stuNumber");
            return (Criteria) this;
        }

        public Criteria andStuNumberLessThanOrEqualTo(Integer value) {
            addCriterion("stu_number <=", value, "stuNumber");
            return (Criteria) this;
        }

        public Criteria andStuNumberIn(List<Integer> values) {
            addCriterion("stu_number in", values, "stuNumber");
            return (Criteria) this;
        }

        public Criteria andStuNumberNotIn(List<Integer> values) {
            addCriterion("stu_number not in", values, "stuNumber");
            return (Criteria) this;
        }

        public Criteria andStuNumberBetween(Integer value1, Integer value2) {
            addCriterion("stu_number between", value1, value2, "stuNumber");
            return (Criteria) this;
        }

        public Criteria andStuNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("stu_number not between", value1, value2, "stuNumber");
            return (Criteria) this;
        }

        public Criteria andStuNameIsNull() {
            addCriterion("stu_name is null");
            return (Criteria) this;
        }

        public Criteria andStuNameIsNotNull() {
            addCriterion("stu_name is not null");
            return (Criteria) this;
        }

        public Criteria andStuNameEqualTo(String value) {
            addCriterion("stu_name =", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameNotEqualTo(String value) {
            addCriterion("stu_name <>", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameGreaterThan(String value) {
            addCriterion("stu_name >", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameGreaterThanOrEqualTo(String value) {
            addCriterion("stu_name >=", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameLessThan(String value) {
            addCriterion("stu_name <", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameLessThanOrEqualTo(String value) {
            addCriterion("stu_name <=", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameLike(String value) {
            addCriterion("stu_name like", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameNotLike(String value) {
            addCriterion("stu_name not like", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameIn(List<String> values) {
            addCriterion("stu_name in", values, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameNotIn(List<String> values) {
            addCriterion("stu_name not in", values, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameBetween(String value1, String value2) {
            addCriterion("stu_name between", value1, value2, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameNotBetween(String value1, String value2) {
            addCriterion("stu_name not between", value1, value2, "stuName");
            return (Criteria) this;
        }

        public Criteria andDateIsNull() {
            addCriterion("date is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("date is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(String value) {
            addCriterion("date =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(String value) {
            addCriterion("date <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(String value) {
            addCriterion("date >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(String value) {
            addCriterion("date >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(String value) {
            addCriterion("date <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(String value) {
            addCriterion("date <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLike(String value) {
            addCriterion("date like", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotLike(String value) {
            addCriterion("date not like", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<String> values) {
            addCriterion("date in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<String> values) {
            addCriterion("date not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(String value1, String value2) {
            addCriterion("date between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(String value1, String value2) {
            addCriterion("date not between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andSortIsNull() {
            addCriterion("sort is null");
            return (Criteria) this;
        }

        public Criteria andSortIsNotNull() {
            addCriterion("sort is not null");
            return (Criteria) this;
        }

        public Criteria andSortEqualTo(String value) {
            addCriterion("sort =", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotEqualTo(String value) {
            addCriterion("sort <>", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortGreaterThan(String value) {
            addCriterion("sort >", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortGreaterThanOrEqualTo(String value) {
            addCriterion("sort >=", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLessThan(String value) {
            addCriterion("sort <", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLessThanOrEqualTo(String value) {
            addCriterion("sort <=", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLike(String value) {
            addCriterion("sort like", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotLike(String value) {
            addCriterion("sort not like", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortIn(List<String> values) {
            addCriterion("sort in", values, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotIn(List<String> values) {
            addCriterion("sort not in", values, "sort");
            return (Criteria) this;
        }

        public Criteria andSortBetween(String value1, String value2) {
            addCriterion("sort between", value1, value2, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotBetween(String value1, String value2) {
            addCriterion("sort not between", value1, value2, "sort");
            return (Criteria) this;
        }

        public Criteria andApplyCreditIsNull() {
            addCriterion("apply_credit is null");
            return (Criteria) this;
        }

        public Criteria andApplyCreditIsNotNull() {
            addCriterion("apply_credit is not null");
            return (Criteria) this;
        }

        public Criteria andApplyCreditEqualTo(Double value) {
            addCriterion("apply_credit =", value, "applyCredit");
            return (Criteria) this;
        }

        public Criteria andApplyCreditNotEqualTo(Double value) {
            addCriterion("apply_credit <>", value, "applyCredit");
            return (Criteria) this;
        }

        public Criteria andApplyCreditGreaterThan(Double value) {
            addCriterion("apply_credit >", value, "applyCredit");
            return (Criteria) this;
        }

        public Criteria andApplyCreditGreaterThanOrEqualTo(Double value) {
            addCriterion("apply_credit >=", value, "applyCredit");
            return (Criteria) this;
        }

        public Criteria andApplyCreditLessThan(Double value) {
            addCriterion("apply_credit <", value, "applyCredit");
            return (Criteria) this;
        }

        public Criteria andApplyCreditLessThanOrEqualTo(Double value) {
            addCriterion("apply_credit <=", value, "applyCredit");
            return (Criteria) this;
        }

        public Criteria andApplyCreditIn(List<Double> values) {
            addCriterion("apply_credit in", values, "applyCredit");
            return (Criteria) this;
        }

        public Criteria andApplyCreditNotIn(List<Double> values) {
            addCriterion("apply_credit not in", values, "applyCredit");
            return (Criteria) this;
        }

        public Criteria andApplyCreditBetween(Double value1, Double value2) {
            addCriterion("apply_credit between", value1, value2, "applyCredit");
            return (Criteria) this;
        }

        public Criteria andApplyCreditNotBetween(Double value1, Double value2) {
            addCriterion("apply_credit not between", value1, value2, "applyCredit");
            return (Criteria) this;
        }

        public Criteria andAuditCreditIsNull() {
            addCriterion("audit_credit is null");
            return (Criteria) this;
        }

        public Criteria andAuditCreditIsNotNull() {
            addCriterion("audit_credit is not null");
            return (Criteria) this;
        }

        public Criteria andAuditCreditEqualTo(Double value) {
            addCriterion("audit_credit =", value, "auditCredit");
            return (Criteria) this;
        }

        public Criteria andAuditCreditNotEqualTo(Double value) {
            addCriterion("audit_credit <>", value, "auditCredit");
            return (Criteria) this;
        }

        public Criteria andAuditCreditGreaterThan(Double value) {
            addCriterion("audit_credit >", value, "auditCredit");
            return (Criteria) this;
        }

        public Criteria andAuditCreditGreaterThanOrEqualTo(Double value) {
            addCriterion("audit_credit >=", value, "auditCredit");
            return (Criteria) this;
        }

        public Criteria andAuditCreditLessThan(Double value) {
            addCriterion("audit_credit <", value, "auditCredit");
            return (Criteria) this;
        }

        public Criteria andAuditCreditLessThanOrEqualTo(Double value) {
            addCriterion("audit_credit <=", value, "auditCredit");
            return (Criteria) this;
        }

        public Criteria andAuditCreditIn(List<Double> values) {
            addCriterion("audit_credit in", values, "auditCredit");
            return (Criteria) this;
        }

        public Criteria andAuditCreditNotIn(List<Double> values) {
            addCriterion("audit_credit not in", values, "auditCredit");
            return (Criteria) this;
        }

        public Criteria andAuditCreditBetween(Double value1, Double value2) {
            addCriterion("audit_credit between", value1, value2, "auditCredit");
            return (Criteria) this;
        }

        public Criteria andAuditCreditNotBetween(Double value1, Double value2) {
            addCriterion("audit_credit not between", value1, value2, "auditCredit");
            return (Criteria) this;
        }

        public Criteria andAuditTeaIsNull() {
            addCriterion("audit_tea is null");
            return (Criteria) this;
        }

        public Criteria andAuditTeaIsNotNull() {
            addCriterion("audit_tea is not null");
            return (Criteria) this;
        }

        public Criteria andAuditTeaEqualTo(String value) {
            addCriterion("audit_tea =", value, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaNotEqualTo(String value) {
            addCriterion("audit_tea <>", value, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaGreaterThan(String value) {
            addCriterion("audit_tea >", value, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaGreaterThanOrEqualTo(String value) {
            addCriterion("audit_tea >=", value, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaLessThan(String value) {
            addCriterion("audit_tea <", value, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaLessThanOrEqualTo(String value) {
            addCriterion("audit_tea <=", value, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaLike(String value) {
            addCriterion("audit_tea like", value, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaNotLike(String value) {
            addCriterion("audit_tea not like", value, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaIn(List<String> values) {
            addCriterion("audit_tea in", values, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaNotIn(List<String> values) {
            addCriterion("audit_tea not in", values, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaBetween(String value1, String value2) {
            addCriterion("audit_tea between", value1, value2, "auditTea");
            return (Criteria) this;
        }

        public Criteria andAuditTeaNotBetween(String value1, String value2) {
            addCriterion("audit_tea not between", value1, value2, "auditTea");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}