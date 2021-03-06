function run_experiment_MMNet(imdb_video)
%% Experiment entry point
    warning off;
    startup;
    opts.gpus = 1;
    if nargin < 1
        imdb_video = [];
    end

    opts.join.method = 'corrfilt';%corrfilt
    opts.join.conf.lambda = 10;
    opts.join.conf.window = 'cos';
    opts.join.conf.sigma = 8;
    opts.join.conf.target_lr = 0;

    opts.branch.conf.num_out = [96 256 384 384 64];
    opts.branch.conf.num_in = [ 3 48 256 192 192];
    opts.branch.conf.conv_stride = [ 2 1 1 1 1];
    opts.branch.conf.pool_stride = [ 2 1];
    
    opts.exemplarSize = 255; %255
    opts.train.numEpochs = 100;

    experiment(imdb_video, opts);

end