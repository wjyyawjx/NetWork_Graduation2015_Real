package com.lyh.springboot.pojo;

import java.util.ArrayList;
import java.util.List;

public class LaboratoryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public LaboratoryExample() {
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

        public Criteria andLIdIsNull() {
            addCriterion("l_id is null");
            return (Criteria) this;
        }

        public Criteria andLIdIsNotNull() {
            addCriterion("l_id is not null");
            return (Criteria) this;
        }

        public Criteria andLIdEqualTo(Integer value) {
            addCriterion("l_id =", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdNotEqualTo(Integer value) {
            addCriterion("l_id <>", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdGreaterThan(Integer value) {
            addCriterion("l_id >", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("l_id >=", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdLessThan(Integer value) {
            addCriterion("l_id <", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdLessThanOrEqualTo(Integer value) {
            addCriterion("l_id <=", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdIn(List<Integer> values) {
            addCriterion("l_id in", values, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdNotIn(List<Integer> values) {
            addCriterion("l_id not in", values, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdBetween(Integer value1, Integer value2) {
            addCriterion("l_id between", value1, value2, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdNotBetween(Integer value1, Integer value2) {
            addCriterion("l_id not between", value1, value2, "lId");
            return (Criteria) this;
        }

        public Criteria andLNameIsNull() {
            addCriterion("l_name is null");
            return (Criteria) this;
        }

        public Criteria andLNameIsNotNull() {
            addCriterion("l_name is not null");
            return (Criteria) this;
        }

        public Criteria andLNameEqualTo(String value) {
            addCriterion("l_name =", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameNotEqualTo(String value) {
            addCriterion("l_name <>", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameGreaterThan(String value) {
            addCriterion("l_name >", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameGreaterThanOrEqualTo(String value) {
            addCriterion("l_name >=", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameLessThan(String value) {
            addCriterion("l_name <", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameLessThanOrEqualTo(String value) {
            addCriterion("l_name <=", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameLike(String value) {
            addCriterion("l_name like", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameNotLike(String value) {
            addCriterion("l_name not like", value, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameIn(List<String> values) {
            addCriterion("l_name in", values, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameNotIn(List<String> values) {
            addCriterion("l_name not in", values, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameBetween(String value1, String value2) {
            addCriterion("l_name between", value1, value2, "lName");
            return (Criteria) this;
        }

        public Criteria andLNameNotBetween(String value1, String value2) {
            addCriterion("l_name not between", value1, value2, "lName");
            return (Criteria) this;
        }

        public Criteria andPlaceIdIsNull() {
            addCriterion("place_id is null");
            return (Criteria) this;
        }

        public Criteria andPlaceIdIsNotNull() {
            addCriterion("place_id is not null");
            return (Criteria) this;
        }

        public Criteria andPlaceIdEqualTo(String value) {
            addCriterion("place_id =", value, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdNotEqualTo(String value) {
            addCriterion("place_id <>", value, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdGreaterThan(String value) {
            addCriterion("place_id >", value, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdGreaterThanOrEqualTo(String value) {
            addCriterion("place_id >=", value, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdLessThan(String value) {
            addCriterion("place_id <", value, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdLessThanOrEqualTo(String value) {
            addCriterion("place_id <=", value, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdLike(String value) {
            addCriterion("place_id like", value, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdNotLike(String value) {
            addCriterion("place_id not like", value, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdIn(List<String> values) {
            addCriterion("place_id in", values, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdNotIn(List<String> values) {
            addCriterion("place_id not in", values, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdBetween(String value1, String value2) {
            addCriterion("place_id between", value1, value2, "placeId");
            return (Criteria) this;
        }

        public Criteria andPlaceIdNotBetween(String value1, String value2) {
            addCriterion("place_id not between", value1, value2, "placeId");
            return (Criteria) this;
        }

        public Criteria andTemIdIsNull() {
            addCriterion("tem_id is null");
            return (Criteria) this;
        }

        public Criteria andTemIdIsNotNull() {
            addCriterion("tem_id is not null");
            return (Criteria) this;
        }

        public Criteria andTemIdEqualTo(Integer value) {
            addCriterion("tem_id =", value, "temId");
            return (Criteria) this;
        }

        public Criteria andTemIdNotEqualTo(Integer value) {
            addCriterion("tem_id <>", value, "temId");
            return (Criteria) this;
        }

        public Criteria andTemIdGreaterThan(Integer value) {
            addCriterion("tem_id >", value, "temId");
            return (Criteria) this;
        }

        public Criteria andTemIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("tem_id >=", value, "temId");
            return (Criteria) this;
        }

        public Criteria andTemIdLessThan(Integer value) {
            addCriterion("tem_id <", value, "temId");
            return (Criteria) this;
        }

        public Criteria andTemIdLessThanOrEqualTo(Integer value) {
            addCriterion("tem_id <=", value, "temId");
            return (Criteria) this;
        }

        public Criteria andTemIdIn(List<Integer> values) {
            addCriterion("tem_id in", values, "temId");
            return (Criteria) this;
        }

        public Criteria andTemIdNotIn(List<Integer> values) {
            addCriterion("tem_id not in", values, "temId");
            return (Criteria) this;
        }

        public Criteria andTemIdBetween(Integer value1, Integer value2) {
            addCriterion("tem_id between", value1, value2, "temId");
            return (Criteria) this;
        }

        public Criteria andTemIdNotBetween(Integer value1, Integer value2) {
            addCriterion("tem_id not between", value1, value2, "temId");
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