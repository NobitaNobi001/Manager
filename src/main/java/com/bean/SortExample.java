package com.bean;

import java.util.ArrayList;
import java.util.List;

public class SortExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SortExample() {
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

        public Criteria andSort01IsNull() {
            addCriterion("sort_01 is null");
            return (Criteria) this;
        }

        public Criteria andSort01IsNotNull() {
            addCriterion("sort_01 is not null");
            return (Criteria) this;
        }

        public Criteria andSort01EqualTo(Double value) {
            addCriterion("sort_01 =", value, "sort01");
            return (Criteria) this;
        }

        public Criteria andSort01NotEqualTo(Double value) {
            addCriterion("sort_01 <>", value, "sort01");
            return (Criteria) this;
        }

        public Criteria andSort01GreaterThan(Double value) {
            addCriterion("sort_01 >", value, "sort01");
            return (Criteria) this;
        }

        public Criteria andSort01GreaterThanOrEqualTo(Double value) {
            addCriterion("sort_01 >=", value, "sort01");
            return (Criteria) this;
        }

        public Criteria andSort01LessThan(Double value) {
            addCriterion("sort_01 <", value, "sort01");
            return (Criteria) this;
        }

        public Criteria andSort01LessThanOrEqualTo(Double value) {
            addCriterion("sort_01 <=", value, "sort01");
            return (Criteria) this;
        }

        public Criteria andSort01In(List<Double> values) {
            addCriterion("sort_01 in", values, "sort01");
            return (Criteria) this;
        }

        public Criteria andSort01NotIn(List<Double> values) {
            addCriterion("sort_01 not in", values, "sort01");
            return (Criteria) this;
        }

        public Criteria andSort01Between(Double value1, Double value2) {
            addCriterion("sort_01 between", value1, value2, "sort01");
            return (Criteria) this;
        }

        public Criteria andSort01NotBetween(Double value1, Double value2) {
            addCriterion("sort_01 not between", value1, value2, "sort01");
            return (Criteria) this;
        }

        public Criteria andSort02IsNull() {
            addCriterion("sort_02 is null");
            return (Criteria) this;
        }

        public Criteria andSort02IsNotNull() {
            addCriterion("sort_02 is not null");
            return (Criteria) this;
        }

        public Criteria andSort02EqualTo(Double value) {
            addCriterion("sort_02 =", value, "sort02");
            return (Criteria) this;
        }

        public Criteria andSort02NotEqualTo(Double value) {
            addCriterion("sort_02 <>", value, "sort02");
            return (Criteria) this;
        }

        public Criteria andSort02GreaterThan(Double value) {
            addCriterion("sort_02 >", value, "sort02");
            return (Criteria) this;
        }

        public Criteria andSort02GreaterThanOrEqualTo(Double value) {
            addCriterion("sort_02 >=", value, "sort02");
            return (Criteria) this;
        }

        public Criteria andSort02LessThan(Double value) {
            addCriterion("sort_02 <", value, "sort02");
            return (Criteria) this;
        }

        public Criteria andSort02LessThanOrEqualTo(Double value) {
            addCriterion("sort_02 <=", value, "sort02");
            return (Criteria) this;
        }

        public Criteria andSort02In(List<Double> values) {
            addCriterion("sort_02 in", values, "sort02");
            return (Criteria) this;
        }

        public Criteria andSort02NotIn(List<Double> values) {
            addCriterion("sort_02 not in", values, "sort02");
            return (Criteria) this;
        }

        public Criteria andSort02Between(Double value1, Double value2) {
            addCriterion("sort_02 between", value1, value2, "sort02");
            return (Criteria) this;
        }

        public Criteria andSort02NotBetween(Double value1, Double value2) {
            addCriterion("sort_02 not between", value1, value2, "sort02");
            return (Criteria) this;
        }

        public Criteria andSort03IsNull() {
            addCriterion("sort_03 is null");
            return (Criteria) this;
        }

        public Criteria andSort03IsNotNull() {
            addCriterion("sort_03 is not null");
            return (Criteria) this;
        }

        public Criteria andSort03EqualTo(Double value) {
            addCriterion("sort_03 =", value, "sort03");
            return (Criteria) this;
        }

        public Criteria andSort03NotEqualTo(Double value) {
            addCriterion("sort_03 <>", value, "sort03");
            return (Criteria) this;
        }

        public Criteria andSort03GreaterThan(Double value) {
            addCriterion("sort_03 >", value, "sort03");
            return (Criteria) this;
        }

        public Criteria andSort03GreaterThanOrEqualTo(Double value) {
            addCriterion("sort_03 >=", value, "sort03");
            return (Criteria) this;
        }

        public Criteria andSort03LessThan(Double value) {
            addCriterion("sort_03 <", value, "sort03");
            return (Criteria) this;
        }

        public Criteria andSort03LessThanOrEqualTo(Double value) {
            addCriterion("sort_03 <=", value, "sort03");
            return (Criteria) this;
        }

        public Criteria andSort03In(List<Double> values) {
            addCriterion("sort_03 in", values, "sort03");
            return (Criteria) this;
        }

        public Criteria andSort03NotIn(List<Double> values) {
            addCriterion("sort_03 not in", values, "sort03");
            return (Criteria) this;
        }

        public Criteria andSort03Between(Double value1, Double value2) {
            addCriterion("sort_03 between", value1, value2, "sort03");
            return (Criteria) this;
        }

        public Criteria andSort03NotBetween(Double value1, Double value2) {
            addCriterion("sort_03 not between", value1, value2, "sort03");
            return (Criteria) this;
        }

        public Criteria andSort04IsNull() {
            addCriterion("sort_04 is null");
            return (Criteria) this;
        }

        public Criteria andSort04IsNotNull() {
            addCriterion("sort_04 is not null");
            return (Criteria) this;
        }

        public Criteria andSort04EqualTo(Double value) {
            addCriterion("sort_04 =", value, "sort04");
            return (Criteria) this;
        }

        public Criteria andSort04NotEqualTo(Double value) {
            addCriterion("sort_04 <>", value, "sort04");
            return (Criteria) this;
        }

        public Criteria andSort04GreaterThan(Double value) {
            addCriterion("sort_04 >", value, "sort04");
            return (Criteria) this;
        }

        public Criteria andSort04GreaterThanOrEqualTo(Double value) {
            addCriterion("sort_04 >=", value, "sort04");
            return (Criteria) this;
        }

        public Criteria andSort04LessThan(Double value) {
            addCriterion("sort_04 <", value, "sort04");
            return (Criteria) this;
        }

        public Criteria andSort04LessThanOrEqualTo(Double value) {
            addCriterion("sort_04 <=", value, "sort04");
            return (Criteria) this;
        }

        public Criteria andSort04In(List<Double> values) {
            addCriterion("sort_04 in", values, "sort04");
            return (Criteria) this;
        }

        public Criteria andSort04NotIn(List<Double> values) {
            addCriterion("sort_04 not in", values, "sort04");
            return (Criteria) this;
        }

        public Criteria andSort04Between(Double value1, Double value2) {
            addCriterion("sort_04 between", value1, value2, "sort04");
            return (Criteria) this;
        }

        public Criteria andSort04NotBetween(Double value1, Double value2) {
            addCriterion("sort_04 not between", value1, value2, "sort04");
            return (Criteria) this;
        }

        public Criteria andSort05IsNull() {
            addCriterion("sort_05 is null");
            return (Criteria) this;
        }

        public Criteria andSort05IsNotNull() {
            addCriterion("sort_05 is not null");
            return (Criteria) this;
        }

        public Criteria andSort05EqualTo(Double value) {
            addCriterion("sort_05 =", value, "sort05");
            return (Criteria) this;
        }

        public Criteria andSort05NotEqualTo(Double value) {
            addCriterion("sort_05 <>", value, "sort05");
            return (Criteria) this;
        }

        public Criteria andSort05GreaterThan(Double value) {
            addCriterion("sort_05 >", value, "sort05");
            return (Criteria) this;
        }

        public Criteria andSort05GreaterThanOrEqualTo(Double value) {
            addCriterion("sort_05 >=", value, "sort05");
            return (Criteria) this;
        }

        public Criteria andSort05LessThan(Double value) {
            addCriterion("sort_05 <", value, "sort05");
            return (Criteria) this;
        }

        public Criteria andSort05LessThanOrEqualTo(Double value) {
            addCriterion("sort_05 <=", value, "sort05");
            return (Criteria) this;
        }

        public Criteria andSort05In(List<Double> values) {
            addCriterion("sort_05 in", values, "sort05");
            return (Criteria) this;
        }

        public Criteria andSort05NotIn(List<Double> values) {
            addCriterion("sort_05 not in", values, "sort05");
            return (Criteria) this;
        }

        public Criteria andSort05Between(Double value1, Double value2) {
            addCriterion("sort_05 between", value1, value2, "sort05");
            return (Criteria) this;
        }

        public Criteria andSort05NotBetween(Double value1, Double value2) {
            addCriterion("sort_05 not between", value1, value2, "sort05");
            return (Criteria) this;
        }

        public Criteria andSort06IsNull() {
            addCriterion("sort_06 is null");
            return (Criteria) this;
        }

        public Criteria andSort06IsNotNull() {
            addCriterion("sort_06 is not null");
            return (Criteria) this;
        }

        public Criteria andSort06EqualTo(Double value) {
            addCriterion("sort_06 =", value, "sort06");
            return (Criteria) this;
        }

        public Criteria andSort06NotEqualTo(Double value) {
            addCriterion("sort_06 <>", value, "sort06");
            return (Criteria) this;
        }

        public Criteria andSort06GreaterThan(Double value) {
            addCriterion("sort_06 >", value, "sort06");
            return (Criteria) this;
        }

        public Criteria andSort06GreaterThanOrEqualTo(Double value) {
            addCriterion("sort_06 >=", value, "sort06");
            return (Criteria) this;
        }

        public Criteria andSort06LessThan(Double value) {
            addCriterion("sort_06 <", value, "sort06");
            return (Criteria) this;
        }

        public Criteria andSort06LessThanOrEqualTo(Double value) {
            addCriterion("sort_06 <=", value, "sort06");
            return (Criteria) this;
        }

        public Criteria andSort06In(List<Double> values) {
            addCriterion("sort_06 in", values, "sort06");
            return (Criteria) this;
        }

        public Criteria andSort06NotIn(List<Double> values) {
            addCriterion("sort_06 not in", values, "sort06");
            return (Criteria) this;
        }

        public Criteria andSort06Between(Double value1, Double value2) {
            addCriterion("sort_06 between", value1, value2, "sort06");
            return (Criteria) this;
        }

        public Criteria andSort06NotBetween(Double value1, Double value2) {
            addCriterion("sort_06 not between", value1, value2, "sort06");
            return (Criteria) this;
        }

        public Criteria andSort07IsNull() {
            addCriterion("sort_07 is null");
            return (Criteria) this;
        }

        public Criteria andSort07IsNotNull() {
            addCriterion("sort_07 is not null");
            return (Criteria) this;
        }

        public Criteria andSort07EqualTo(Double value) {
            addCriterion("sort_07 =", value, "sort07");
            return (Criteria) this;
        }

        public Criteria andSort07NotEqualTo(Double value) {
            addCriterion("sort_07 <>", value, "sort07");
            return (Criteria) this;
        }

        public Criteria andSort07GreaterThan(Double value) {
            addCriterion("sort_07 >", value, "sort07");
            return (Criteria) this;
        }

        public Criteria andSort07GreaterThanOrEqualTo(Double value) {
            addCriterion("sort_07 >=", value, "sort07");
            return (Criteria) this;
        }

        public Criteria andSort07LessThan(Double value) {
            addCriterion("sort_07 <", value, "sort07");
            return (Criteria) this;
        }

        public Criteria andSort07LessThanOrEqualTo(Double value) {
            addCriterion("sort_07 <=", value, "sort07");
            return (Criteria) this;
        }

        public Criteria andSort07In(List<Double> values) {
            addCriterion("sort_07 in", values, "sort07");
            return (Criteria) this;
        }

        public Criteria andSort07NotIn(List<Double> values) {
            addCriterion("sort_07 not in", values, "sort07");
            return (Criteria) this;
        }

        public Criteria andSort07Between(Double value1, Double value2) {
            addCriterion("sort_07 between", value1, value2, "sort07");
            return (Criteria) this;
        }

        public Criteria andSort07NotBetween(Double value1, Double value2) {
            addCriterion("sort_07 not between", value1, value2, "sort07");
            return (Criteria) this;
        }

        public Criteria andSort08IsNull() {
            addCriterion("sort_08 is null");
            return (Criteria) this;
        }

        public Criteria andSort08IsNotNull() {
            addCriterion("sort_08 is not null");
            return (Criteria) this;
        }

        public Criteria andSort08EqualTo(Double value) {
            addCriterion("sort_08 =", value, "sort08");
            return (Criteria) this;
        }

        public Criteria andSort08NotEqualTo(Double value) {
            addCriterion("sort_08 <>", value, "sort08");
            return (Criteria) this;
        }

        public Criteria andSort08GreaterThan(Double value) {
            addCriterion("sort_08 >", value, "sort08");
            return (Criteria) this;
        }

        public Criteria andSort08GreaterThanOrEqualTo(Double value) {
            addCriterion("sort_08 >=", value, "sort08");
            return (Criteria) this;
        }

        public Criteria andSort08LessThan(Double value) {
            addCriterion("sort_08 <", value, "sort08");
            return (Criteria) this;
        }

        public Criteria andSort08LessThanOrEqualTo(Double value) {
            addCriterion("sort_08 <=", value, "sort08");
            return (Criteria) this;
        }

        public Criteria andSort08In(List<Double> values) {
            addCriterion("sort_08 in", values, "sort08");
            return (Criteria) this;
        }

        public Criteria andSort08NotIn(List<Double> values) {
            addCriterion("sort_08 not in", values, "sort08");
            return (Criteria) this;
        }

        public Criteria andSort08Between(Double value1, Double value2) {
            addCriterion("sort_08 between", value1, value2, "sort08");
            return (Criteria) this;
        }

        public Criteria andSort08NotBetween(Double value1, Double value2) {
            addCriterion("sort_08 not between", value1, value2, "sort08");
            return (Criteria) this;
        }

        public Criteria andSort09IsNull() {
            addCriterion("sort_09 is null");
            return (Criteria) this;
        }

        public Criteria andSort09IsNotNull() {
            addCriterion("sort_09 is not null");
            return (Criteria) this;
        }

        public Criteria andSort09EqualTo(Double value) {
            addCriterion("sort_09 =", value, "sort09");
            return (Criteria) this;
        }

        public Criteria andSort09NotEqualTo(Double value) {
            addCriterion("sort_09 <>", value, "sort09");
            return (Criteria) this;
        }

        public Criteria andSort09GreaterThan(Double value) {
            addCriterion("sort_09 >", value, "sort09");
            return (Criteria) this;
        }

        public Criteria andSort09GreaterThanOrEqualTo(Double value) {
            addCriterion("sort_09 >=", value, "sort09");
            return (Criteria) this;
        }

        public Criteria andSort09LessThan(Double value) {
            addCriterion("sort_09 <", value, "sort09");
            return (Criteria) this;
        }

        public Criteria andSort09LessThanOrEqualTo(Double value) {
            addCriterion("sort_09 <=", value, "sort09");
            return (Criteria) this;
        }

        public Criteria andSort09In(List<Double> values) {
            addCriterion("sort_09 in", values, "sort09");
            return (Criteria) this;
        }

        public Criteria andSort09NotIn(List<Double> values) {
            addCriterion("sort_09 not in", values, "sort09");
            return (Criteria) this;
        }

        public Criteria andSort09Between(Double value1, Double value2) {
            addCriterion("sort_09 between", value1, value2, "sort09");
            return (Criteria) this;
        }

        public Criteria andSort09NotBetween(Double value1, Double value2) {
            addCriterion("sort_09 not between", value1, value2, "sort09");
            return (Criteria) this;
        }

        public Criteria andSort10IsNull() {
            addCriterion("sort_10 is null");
            return (Criteria) this;
        }

        public Criteria andSort10IsNotNull() {
            addCriterion("sort_10 is not null");
            return (Criteria) this;
        }

        public Criteria andSort10EqualTo(Double value) {
            addCriterion("sort_10 =", value, "sort10");
            return (Criteria) this;
        }

        public Criteria andSort10NotEqualTo(Double value) {
            addCriterion("sort_10 <>", value, "sort10");
            return (Criteria) this;
        }

        public Criteria andSort10GreaterThan(Double value) {
            addCriterion("sort_10 >", value, "sort10");
            return (Criteria) this;
        }

        public Criteria andSort10GreaterThanOrEqualTo(Double value) {
            addCriterion("sort_10 >=", value, "sort10");
            return (Criteria) this;
        }

        public Criteria andSort10LessThan(Double value) {
            addCriterion("sort_10 <", value, "sort10");
            return (Criteria) this;
        }

        public Criteria andSort10LessThanOrEqualTo(Double value) {
            addCriterion("sort_10 <=", value, "sort10");
            return (Criteria) this;
        }

        public Criteria andSort10In(List<Double> values) {
            addCriterion("sort_10 in", values, "sort10");
            return (Criteria) this;
        }

        public Criteria andSort10NotIn(List<Double> values) {
            addCriterion("sort_10 not in", values, "sort10");
            return (Criteria) this;
        }

        public Criteria andSort10Between(Double value1, Double value2) {
            addCriterion("sort_10 between", value1, value2, "sort10");
            return (Criteria) this;
        }

        public Criteria andSort10NotBetween(Double value1, Double value2) {
            addCriterion("sort_10 not between", value1, value2, "sort10");
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