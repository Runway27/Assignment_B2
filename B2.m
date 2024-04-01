% Prior belief
mu = 0.51852; % mean
var = 0.008916; % variance

% Solve for alpha and beta
beta_prior = mu * ( (1 - mu) / var - 1 );
alpha_prior = mu * beta_prior / (1 - mu);

% Coin toss results
n_heads = 26;
n_tails = 50 - n_heads;

% Posterior parameters
alpha_post = alpha_prior + n_heads;
beta_post = beta_prior + n_tails;

% Values for p
p = 0:0.01:1;

% Prior and posterior distributions
prior = betapdf(p, alpha_prior, beta_prior);
posterior = betapdf(p, alpha_post, beta_post);

% Plot
figure;
plot(p, prior, 'b-', 'LineWidth', 2);
hold on;
plot(p, posterior, 'r-', 'LineWidth', 2);
legend('Prior', 'Posterior');
xlabel('p');
ylabel('Density');
title('Prior and Posterior Distributions');
grid on;
