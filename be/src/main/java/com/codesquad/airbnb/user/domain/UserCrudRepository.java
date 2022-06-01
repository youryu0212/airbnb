package com.codesquad.airbnb.user.domain;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserCrudRepository extends JpaRepository<User, Long> {
}
