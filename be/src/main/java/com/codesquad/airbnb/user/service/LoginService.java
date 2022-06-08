package com.codesquad.airbnb.user.service;

import com.codesquad.airbnb.user.domain.User;
import com.codesquad.airbnb.user.domain.UserCrudRepository;
import com.codesquad.airbnb.user.web.dto.GitHubAccessToken;
import com.codesquad.airbnb.user.web.dto.LoginResponseDto;
import com.codesquad.airbnb.user.web.dto.UserInformationDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Slf4j
@Transactional
@Service
public class LoginService {

    private static final String GITHUB_TOKEN_URL = "https://github.com/login/oauth/access_token";
    private static final String GITHUB_RESOURCE_URL = "https://api.github.com/user";

    private final String clientId;
    private final String clientSecret;
    private final UserCrudRepository userCrudRepository;
    private final JwtTokenProvider tokenProvider;

    public LoginService(
            @Value("${oauth2.provider.github.client_id}") String clientId,
            @Value("${oauth2.provider.github.secret}") String clientSecret,
            UserCrudRepository userCrudRepository,
            JwtTokenProvider tokenProvider) {
        this.clientId = clientId;
        this.clientSecret = clientSecret;
        this.userCrudRepository = userCrudRepository;
        this.tokenProvider = tokenProvider;
    }

    public LoginResponseDto login(String code) {
        GitHubAccessToken token = getGitHubAccessToken(code);

        UserInformationDto userInformationDto = getUserInformationDto(token);

        log.debug("UserService, UserInformationDto: {}", userInformationDto);

        Optional<User> foundUser = userCrudRepository.findByOauthId(userInformationDto.getOauthId());

        User user = userInformationDto.toEntity();
        if (foundUser.isEmpty()) {
            user = userCrudRepository.save(user);
        } else {
            user = foundUser.get();
        }

        String accessToken = tokenProvider.createAccessToken(String.valueOf(user.getId()));

        return new LoginResponseDto("Bearer", accessToken);
    }

    private UserInformationDto getUserInformationDto(GitHubAccessToken token) {
        Map<String, String> userInformation = getUserInformation(token)
                .orElseThrow(() -> new IllegalArgumentException("사용자 정보가 없습니다."));

        return new UserInformationDto(
                userInformation.get("id"),
                userInformation.get("email"),
                userInformation.get("login"),
                token);
    }

    private GitHubAccessToken getGitHubAccessToken(String code) {
        MultiValueMap<String, String> requestPayloads = new LinkedMultiValueMap<>();

        requestPayloads.add("client_id", clientId);
        requestPayloads.add("client_secret", clientSecret);
        requestPayloads.add("code", code);

        HttpHeaders headers = new HttpHeaders();

        headers.add("Accept", "application/json");

        HttpEntity<MultiValueMap<String, String>> githubTokenReqeust =
                new HttpEntity<>(requestPayloads, headers);

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<GitHubAccessToken> tokenEntity = restTemplate.postForEntity(GITHUB_TOKEN_URL, githubTokenReqeust, GitHubAccessToken.class);

        GitHubAccessToken token = tokenEntity.getBody();

        log.debug("LoginService Token: {}", token);
        return token;
    }

    private Optional<Map<String, String>> getUserInformation(GitHubAccessToken token) {

        RestTemplate restTemplate = new RestTemplate();
        RequestEntity<Void> request = RequestEntity.get(GITHUB_RESOURCE_URL)
                .header("Authorization", "token " + token.getAccessToken())
                .accept(MediaType.APPLICATION_JSON)
                .build();

        ParameterizedTypeReference<HashMap<String, String>> responseType = new ParameterizedTypeReference<>() {
        };

        HashMap<String, String> userProfileMap = restTemplate.exchange(request, responseType).getBody();

        log.debug("LoginService, User profile: {}", userProfileMap);
        log.debug("LoginService, User profile: {}", userProfileMap.get("name"));
        log.debug("LoginService, User profile: {}", userProfileMap.get("id"));

        return Optional.ofNullable(userProfileMap);
    }
}
